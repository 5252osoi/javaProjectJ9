package posting;

public class PostReplyVO {
	private int idx;
	private int postIdx;
	private String mid;
	private String hostIp;
	private String content;
	private String wDate;
	private int likes;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	@Override
	public String toString() {
		return "PostReplyVO [idx=" + idx + ", postIdx=" + postIdx + ", mid=" + mid + ", hostIp=" + hostIp + ", content="
				+ content + ", wDate=" + wDate + ", likes=" + likes + "]";
	}
	
}
