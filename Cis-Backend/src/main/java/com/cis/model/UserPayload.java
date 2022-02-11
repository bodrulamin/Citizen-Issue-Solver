package com.cis.model;



public class UserPayload {
		String username;
		String password;
		UserType usertype;	
		
		
		public UserPayload(String username, String password, UserType usertype) {
			super();
			this.username = username;
			this.password = password;
			this.usertype = usertype;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public UserType getUsertype() {
			return usertype;
		}
		public void setUsertype(UserType usertype) {
			this.usertype = usertype;
		}
		
		
		

}
