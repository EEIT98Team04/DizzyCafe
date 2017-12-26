package allPay.payment.integration.exception;

/*java.lang.Error
錯誤。是所有錯誤的基類，用於標識嚴重的程序運行問題。這些問題通常描述一些不應被應用程序捕獲的反常情況。*/
public class AllPayException extends Error{
	private static final long serialVersionUID = 1L;
	String NewExceptionMessage;
	public AllPayException(String s){
		this.NewExceptionMessage = s;
	}
	public String getNewExceptionMessage() {
		return NewExceptionMessage;
	}
	public void setNewExceptionMessage(String newExceptionMessage) {
		NewExceptionMessage = newExceptionMessage;
	}
	public void ShowExceptionMessage(){
		
		System.out.println("發生錯誤: " + getNewExceptionMessage());
	}
	
}
