package osh.action;

public class OshActionForward {
	private boolean redirect;
	private String view;
	public OshActionForward() {}
	public OshActionForward(boolean redirect, String view) {
		this.redirect = redirect;
		this.view = view;
	}
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
}
