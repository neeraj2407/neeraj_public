package com.mkyong.web.model;

public class Tag {

	public int id;
	public String tagName;
	public int users;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	
	public int getUsers() {
		return users;
	}

	public void setUsers(int users) {
		this.users = users;
	}

	public Tag(int id, String tagName, int users) {
		this.id = id;
		this.tagName = tagName;
		this.users = users;
	}

}