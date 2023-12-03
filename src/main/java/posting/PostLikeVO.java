package posting;

public class PostLikeVO {
	private int idx;
	private int postIdx;
	private String mid;
	private int replyIdx;
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
	public int getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	@Override
	public String toString() {
		return "PostLikeVO [idx=" + idx + ", postIdx=" + postIdx + ", mid=" + mid + ", replyIdx=" + replyIdx + "]";
	}
	
}
