package action.member;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import action.ActionForward;

public class PictureAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// �̹��� ���� ���ε��� ��ġ : ���� ����/picture ������ ����
		String path = request.getServletContext().getRealPath("/") + "movie/member/picture/";
		int size = 10*1024*1024;
		// ������ ������ ���� ����ϴ�...
		File pathDirectory = new File(path);
	    if (!pathDirectory.exists()) {
	        pathDirectory.mkdirs();
	    }
		// �̹��� ���� ���ε�, request ��ü ��� �Ұ��ϹǷ� MultipartRequest ���
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		String fname = multi.getFilesystemName("picture");
		
		//�̹��� ������ 3���� 1ũ���� ������ �̹��� ����, ���� �̸��� sm_�����̸�.jpg ���� ����
		BufferedImage bi = ImageIO.read(new File(path + fname));
		int width = bi.getWidth()/3;
		int height = bi.getHeight()/3;
		BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = thumb.createGraphics();
		g.drawImage(bi,0,0,width,height,null);
		File f = new File(path + "sm_" + fname);
		ImageIO.write(thumb,"jpg",f);
		String thumbnail = "sm_" + fname;
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

}
