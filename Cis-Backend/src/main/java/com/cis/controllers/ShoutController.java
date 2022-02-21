package com.cis.controllers;

import com.cis.mail.EmailService;
import com.cis.model.*;
import com.cis.repository.ShoutRepository;
import com.cis.repository.UserRepository;
import com.cis.storage.service.FileStorageService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.List;

@RestController
@RequestMapping("/shout")
@CrossOrigin(value = "*", maxAge = 3600)
public class ShoutController {


    private final ShoutRepository shoutRepository;
    private final UserRepository userRepository;
    private final EmailService emailService;
    private final ApiResponse res;
    private final FileStorageService fileStorageService;

    @Autowired
    public ShoutController(ShoutRepository shoutRepository, UserRepository userRepository, EmailService emailService, ApiResponse res, FileStorageService fileStorageService) {
        this.shoutRepository = shoutRepository;
        this.userRepository = userRepository;
        this.emailService = emailService;
        this.res = res;
        this.fileStorageService = fileStorageService;
    }

    @PostMapping("/add")
    public ApiResponse addShout(@RequestParam("photo") MultipartFile file, @RequestParam("shout") String shoutString) throws Exception {
        ObjectMapper om = new ObjectMapper();
        Shout shout = om.readValue(shoutString, Shout.class);
        res.getData().put("shout", shout);
        String fileName = fileStorageService.storeFile(file);

        try {

            String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath().path("/downloadFile/")
                    .path(fileName).toUriString();
            shout.setPhoto(fileDownloadUri);

            Shout savedShout = shoutRepository.save(shout);

            res.setMsg("Shout added Successfuly !");
            res.setStatus(Status.success);
            res.getData().put("shout", shout);

            List<User> userstosendmail = userRepository.findAllByUsertype(UserType.provider);

            String[] emails = userstosendmail.stream().map(User::getEmail).toArray(String[]::new);
            for (String string : emails) {
                System.out.println(string);
            }

            System.out.println(emails);

            emailService.sendSimpleMessage(emails, shout.getShoutTitle(), shout.getShoutmessage());

        } catch (Exception ex) {
            res.setStatus(Status.failed);
            if (ex.getCause() instanceof ConstraintViolationException) {
                res.setMsg("Shout already exists");
            } else {
                res.setMsg("Failed to add shout");
            }

        }
        return res;

    }

    @PostMapping("/update")
    public ApiResponse update(@RequestBody Shout shout) throws Exception {
        res.getData().put("shout", shout);

        try {
            shoutRepository.save(shout);
            res.setMsg("Shout updated Successfuly !");
            res.setStatus(Status.success);

        } catch (Exception ex) {
            res.setStatus(Status.failed);
            if (ex.getCause() instanceof ConstraintViolationException) {
                res.setMsg("Shout already exists");
            } else {
                res.setMsg("Failed to add shout");
            }

        }
        return res;

    }

    @PostMapping("/delete")
    public ApiResponse deleteShout(@RequestBody Shout shout) throws Exception {

        try {
            shoutRepository.delete(shout);
            res.setMsg("Shout Deleted Successfuly !");
            res.getData().put("shout", shout);
            res.setStatus(Status.success);
        } catch (Exception e) {
            res.getData().put("shout", shout);
            res.setMsg(" failed to delete shout !");
            res.setStatus(Status.failed);
        }

        return res;

    }

    @GetMapping("/getOne/{id}")
    public ApiResponse getOne(@PathVariable(value = "id") long id) throws Exception {

        try {
            Shout shout = shoutRepository.findById(id).get();
            res.setMsg("All shouts loaded Successfuly !");
            res.getData().put("shout", shout);
            res.setStatus(Status.success);
        } catch (Exception e) {
            res.getData().put("shout", null);
            res.setMsg(e.getMessage());
            res.setStatus(Status.failed);
        }

        return res;

    }

    @PostMapping("/updatestatus")
    public ApiResponse updateStatus(@RequestBody Shout shout) throws Exception {
        res.getData().put("shout", shout);

        try {
            shoutRepository.save(shout);
            res.setMsg("Shout status updated Successfuly !");
            res.setStatus(Status.success);
            User actionTaker = userRepository.findById(shout.getActionTakerId()).get();
            User shouter = userRepository.findById(shout.getShouterId()).get();
            if (shout.getStatus() == ShoutStatus.started) {
                emailService.sendSimpleMessage(shouter.getEmail(), "Issue solving in progress by " + actionTaker.getFullname(),
                        "Shout Title:" + shout.getShoutTitle() + '\n' + shout.getShoutmessage());

            } else if (shout.getStatus() == ShoutStatus.completed) {
                emailService.sendSimpleMessage(shouter.getEmail(), "Your issue is solved!",
                        "Shout Title:" + shout.getShoutTitle() + '\n' + shout.getShoutmessage());

            }

        } catch (Exception ex) {
            res.setStatus(Status.failed);
            if (ex.getCause() instanceof ConstraintViolationException) {
                res.setMsg("Shout already exists");
            } else {
                res.setMsg("Failed to add shout");
            }

        }
        return res;

    }

    @GetMapping("/getAll")
    public ApiResponse getAll() throws Exception {

        try {
            List<Shout> cats = (List<Shout>) shoutRepository.findAll();
            res.setMsg("All shouts loaded Successfuly !");
            res.getData().put("shout", cats);
            res.setStatus(Status.success);
        } catch (Exception e) {
            res.getData().put("shout", null);
            res.setMsg(e.getMessage());
            res.setStatus(Status.failed);
        }

        return res;

    }

    @GetMapping("/getAll/{userId}")
    public ApiResponse getAllOfShouterid(@PathVariable("userId") Long userId) throws Exception {
        List<Shout> cats = null;
        User user = userRepository.findById(userId).get();
        if (user.getUsertype() == UserType.provider) {
            cats = (List<Shout>) shoutRepository.getShoutsOfProvider(user.getId());

        } else if (user.getUsertype() == UserType.citizen) {
            cats = (List<Shout>) shoutRepository.getShoutsOfShouter(user.getId());
        }
        try {

            res.setMsg("All shouts loaded Successfuly !");
            res.getData().put("shout", cats);
            res.setStatus(Status.success);
        } catch (Exception e) {
            res.getData().put("shout", null);
            res.setMsg(e.getMessage());
            res.setStatus(Status.failed);
        }

        return res;

    }

}
