package com.sohu.mail.model;


public class Mail {

	private String from;
	private String to;
	private String subject;
	private String content;
	private String multipart;
	private String sentDate;

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMultipart() {
		return multipart;
	}

	public void setMultipart(String multipart) {
		this.multipart = multipart;
	}

	public String getSentDate() {
	    return sentDate;
    }

	public void setSentDate(String sentDate) {
	    this.sentDate = sentDate;
    }

	public Mail() {
	}

	public Mail(String to, String subject, String content, String multipart) {
		this.to = to;
		this.subject = subject;
		this.content = content;
		this.multipart = multipart;
	}

}
