package posting;

public class PostingVO {
	private int idx;
	private String mid;
	private String fName;
	private String fSName;
	private int fSize;
	private String content;
	private String hostIp;
	private String openSw;
	private int likes;
	private String wDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public int getfSize() {
		return fSize;
	}
	public void setfSize(int fSize) {
		this.fSize = fSize;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public String getOpenSw() {
		return openSw;
	}
	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	@Override
	public String toString() {
		return "PostingVO [idx=" + idx + ", mid=" + mid + ", fName=" + fName + ", fSName=" + fSName + ", fSize=" + fSize
				+ ", content=" + content + ", hostIp=" + hostIp + ", openSw=" + openSw + ", likes=" + likes + ", wDate="
				+ wDate + "]";
	}
	
	
}
