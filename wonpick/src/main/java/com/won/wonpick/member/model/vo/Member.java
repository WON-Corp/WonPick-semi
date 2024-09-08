package com.won.wonpick.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {

	private String userId;
	private String password;
	private String userName;
	private String nickName;
	private String email;
	private String phone;
	private String gender;
	private Date birth;
	private String address;
	private String introduce;
	private String pfImg;
	private String status;
	
}
