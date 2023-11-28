package member;

public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String pr;
	private String userInfor;
	private String userDel;
	private int post;
	private int follow;
	private int follower;
	
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPr() {
		return pr;
	}
	public void setPr(String pr) {
		this.pr = pr;
	}
	public String getUserInfor() {
		return userInfor;
	}
	public void setUserInfor(String userInfor) {
		this.userInfor = userInfor;
	}
	public String getUserDel() {
		return userDel;
	}
	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public int getFollow() {
		return follow;
	}
	public void setFollow(int follow) {
		this.follow = follow;
	}
	public int getFollower() {
		return follower;
	}
	public void setFollower(int follower) {
		this.follower = follower;
	}
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", tel=" + tel + ", pr=" + pr + ", userInfor=" + userInfor + ", userDel=" + userDel + ", post=" + post
				+ ", follow=" + follow + ", follower=" + follower + "]";
	}
	
	
}
