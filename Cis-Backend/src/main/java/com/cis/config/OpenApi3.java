package com.cis.config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.info.License;
import io.swagger.v3.oas.annotations.security.SecurityScheme;
import io.swagger.v3.oas.annotations.servers.Server;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.context.annotation.Configuration;

@Configuration
@OpenAPIDefinition(
        servers = {
                @Server(url = "http://localhost:9002"),

        },
        tags = {

        },

        info = @Info(
                title = "Citizen Issue Solver API",
                version = "v1",
                license = @License(
                        url = "http://localhost:9002/oauth2/authorize/google?redirect_uri=http://localhost:3000/oauth2/redirect",
                        name = "Get Token localhost"

                ),
                contact = @Contact(
                        url = "citizenissuesolver.com",
                        name = "Citizen Issue Solver"
                ),
                description = "Click on 'Get Token' to get Authorization token.")
)
@SecurityScheme(
        name = "bearerAuth",
        type = SecuritySchemeType.HTTP,
        bearerFormat = "JWT",
        scheme = "bearer"
)
public class OpenApi3 {
}
