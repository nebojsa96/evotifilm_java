package evotifilm.chat;

public class Message {
	private String from;
    private String to;
    private String content;
    private String[] usersList;

    @Override
    public String toString() {
        return super.toString();
    }

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

	public String[] getUsersList() {
		return usersList;
	}

	public void setUsersList(String[] usersList) {
		this.usersList = usersList;
	}
}
