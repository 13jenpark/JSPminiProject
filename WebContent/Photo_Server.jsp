<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

	MultipartRequest multi = new MultipartRequest(request,"C:\\Upload", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	String tmp;
	String algo = multi.getParameter("algo");
	String para = multi.getParameter("para");

	Enumeration files = multi.getFileNames();
	tmp=(String) files.nextElement();
	String fileName = multi.getFilesystemName(tmp);
	
	// ����ó�� ���α׷� �⺻ ó��
	// lena256.raw ������ �о, ����ó�� �˰��� ���ؼ� ó������, ����� �����ϱ�..
	// (1) JSP���� ���� ó��
	int inW, inH, outW=0, outH=0;

	File inFp;
	FileInputStream inFs;
	inFp = new File("C:/Upload/"+fileName);
	
	//���� ũ�� ��������
	long fLen=inFp.length();
	inH=inW=(int)Math.sqrt(fLen);
	
	inFs = new FileInputStream(inFp.getPath());
	// (2) JSP���� �迭 ó��
	int[][]  inImage = new int[inH][inW]; // �޸� �Ҵ�
	// ���� --> �޸�
	for (int i=0; i<inH; i++) {
		for (int k=0; k<inW; k++) {
			inImage[i][k] = inFs.read();
		}
	}
	inFs.close();
	
	int[][] outImage=null;
	
	switch (algo){
		case "1" : //�����ϱ�
			// (3) �˰����� �����ϱ�...
			// ���� �˰��� :  out = 255 - in
			// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
			outH = inH;
			outW = inW;
			// �޸� �Ҵ�
			outImage = new int[outH][outW];
			// ��¥ ����ó�� �˰���
			for(int i=0; i<inH; i++)
				for (int k=0; k<inW; k++) {
					outImage[i][k] = 255 - inImage[i][k];
				}
			break;
		case "2" : //����ϱ�
			// (3) �˰����� �����ϱ�...
			// ����ϱ� �˰��� :  out = in + ��(�����÷ο� ����)
			// (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
			outH = inH;
			outW = inW;
			// �޸� �Ҵ�
			outImage = new int[outH][outW];
			// ��¥ ����ó�� �˰���
			for(int i=0; i<inH; i++)
				for (int k=0; k<inW; k++) {
					outImage[i][k] = inImage[i][k] + Integer.parseInt(para);
					if(outImage[i][k] >255)
						outImage[i][k]=255;
				}
			break;
		case "3" : //��Ӱ��ϱ�
			outH = inH;
			outW = inW;
			// �޸� �Ҵ�
			outImage = new int[outH][outW];
			// ��¥ ����ó�� �˰���
			for(int i=0; i<inH; i++)
				for (int k=0; k<inW; k++) {
					outImage[i][k] = inImage[i][k] - Integer.parseInt(para);
					if(outImage[i][k] < 0)
						outImage[i][k]=0;
				}
			break;
		case "4" : //x,y�� �̵��ϱ�
			outH = inH;
			outW = inW;

			//�޸� �Ҵ�
			outImage = new int[outH][outW];

			// ��¥ ����ó�� �˰���
			for(int i=0; i<inH; i++)
				for(int k=0; k<inW; k++){
					if(i<Integer.parseInt(para)||k<Integer.parseInt(para))
						outImage[i][k]=0;
					else if(i+Integer.parseInt(para)<outW && k+Integer.parseInt(para)<outH)
						outImage[i+Integer.parseInt(para)][k+Integer.parseInt(para)]=inImage[i][k];
				}
			break;
		case "5" : //Ȯ���ϱ�
			outH = inH*Integer.parseInt(para);
			outW = inW*Integer.parseInt(para);

			//�޸� �Ҵ�
			outImage = new int[outH][outW];
			// ��¥ ����ó�� �˰���
			for(int i=0; i<inH*Integer.parseInt(para); i++)
				for(int k=0; k<inW*Integer.parseInt(para); k++){
					outImage[i][k]=inImage[i/Integer.parseInt(para)][k/Integer.parseInt(para)];
				}
			break;
		case "6" : //����ϱ�
			outH = inH/Integer.parseInt(para);
			outW = inW/Integer.parseInt(para);

			//�޸� �Ҵ�
			outImage = new int[outH][outW];
			// ��¥ ����ó�� �˰���
			for(int i=0; i<inH/Integer.parseInt(para); i++)
				for(int k=0; k<inW/Integer.parseInt(para); k++){
					outImage[i][k]=inImage[i*Integer.parseInt(para)][k*Integer.parseInt(para)];
				}
			break;
		case "7" : //ȸ���ϱ�
			outH = inH;
			outW = inW;

			//�޸� �Ҵ�
			outImage = new int[outH][outW];

			// ��¥ ����ó�� �˰���
			double radian=Integer.parseInt(para)*Math.PI/180.0;
			radian = -radian;

			//xd=cos*xs - sin*ys
			//yd=sin*xs + cos*ys
			int xd, yd, xs, ys;
			int cx=inH/2;
			int cy=inW/2;

			for(int i=0; i<outH; i++)
				for(int k=0; k<outW; k++){
					xs=i;
					ys=k;
					xd=(int)(Math.cos(radian)*(xs-cx)-Math.sin(radian)*(ys-cy)+cx);
					yd=(int)(Math.sin(radian)*(xs-cx)+Math.cos(radian)*(ys-cy)+cy);
					
					//ȸ�� ������ ��ġ�� ��¿����� �����ȿ� �ִ���
					if((0<=xd&&xd <outH) &&(0<=yd&&yd<outW))
						outImage[xs][ys]=inImage[xd][yd];
					else
						outImage[xs][ys]=255;
				}
			break;
		case "8" : //������
			outH = inH;
			outW = inW;

			//�޸� �Ҵ�
			outImage = new int[outH][outW];

			//ȭ�ҿ���ó��
			int mask[][] = {{-1, 0, 0},
							{0, 0, 0},
							{0, 0, 1}};
			//�ӽ� �Է� �迭 ����
			int [][] tempInImage=new int[inH+2][inW+2];
			//�ӽ� �Է� �迭�� �Է� �迭 ������ �Է�
			for(int i=0; i<inH; i++){
				for(int k=0; k<inW; k++){
					tempInImage[i][k] = inImage[i][k];
				}
			}
			// �ӽ� ��� �迭 ����
			int[][] tempOutImage=new int[outH][outW];

			// ����ó���˰���
			// ��¥ ����ó�� �˰���
			for(int i=0; i<inH; i++){
				for(int k=0; k<inW; k++){
					int S =0;
					for(int m=0; m<3; m++){
						for( int n=0; n<3; n++){
							S += mask[m][n] * tempInImage[i+m][k+n];
						}
					}
					tempOutImage[i][k] = S;
				}
			}

			//����ũ �հ� 0�϶� �߰������� �ٲ��ֱ�(�ʹ� ��ο��� �Ⱥ��ϼ� ������)
			for(int i=0; i<outH; i++)
				for(int k=0; k<outW; k++)
					tempOutImage[i][k] +=127;

			//�ӽ���¹迭���� ��¥ ��¹迭�� ����
			for(int i=0; i<outH; i++)
				for(int k=0; k<outW; k++){
					int v = tempOutImage[i][k];
					
					if(tempOutImage[i][k]>255)
						tempOutImage[i][k]=255;
					if(tempOutImage[i][k]<0)
						tempOutImage[i][k]=0;
					outImage[i][k] = tempOutImage[i][k];
				}
			break;
		case "9" : //����
			outH = inH;
			outW = inW;

			//�޸� �Ҵ�
			outImage = new int[outH][outW];

			//ȭ�ҿ���ó��
			double mask2[][] = {{1.0/9.0, 1.0/9.0, 1.0/9.0},
							{1.0/9.0, 1.0/9.0, 1.0/9.0},
							{1.0/9.0, 1.0/9.0, 1.0/9.0}};
			//�ӽ� �Է� �迭 ����
			int [][] tempInImage2=new int[inH+2][inW+2];
			//�ӽ� �Է� �迭�� �Է� �迭 ������ �Է�
			for(int i=0; i<inH; i++){
				for(int k=0; k<inW; k++){
					tempInImage2[i][k] = inImage[i][k];
				}
			}
			// �ӽ� ��� �迭 ����
			int[][] tempOutImage2=new int[outH][outW];

			// ����ó���˰���
			// ��¥ ����ó�� �˰���
			for(int i=0; i<inH; i++){
				for(int k=0; k<inW; k++){
					double S =0.0;
					for(int m=0; m<3; m++){
						for( int n=0; n<3; n++){
							S += mask2[m][n] * tempInImage2[i+m][k+n];
						}
					}
					tempOutImage2[i][k] = (int)S;
				}
			}

			//����ũ �հ� 0�϶� �߰������� �ٲ��ֱ�(�ʹ� ��ο��� �Ⱥ��ϼ� ������)
			for(int i=0; i<outH; i++)
				for(int k=0; k<outW; k++)
					if(tempOutImage2[i][k]<0)
						tempOutImage2[i][k] +=127;

			//�ӽ���¹迭���� ��¥ ��¹迭�� ����
			for(int i=0; i<outH; i++)
				for(int k=0; k<outW; k++){
					if(tempOutImage2[i][k]>255)
						tempOutImage2[i][k]=255;
					if(tempOutImage2[i][k]<0)
						tempOutImage2[i][k]=0;
					outImage[i][k] = tempOutImage2[i][k];
				}
			break;
		
	}
	
	// (4) ����� ���Ϸ� ����
	File outFp;
	FileOutputStream outFs;
	String OutFname = "out_" + fileName;
	outFp = new File("C:/Out/"+OutFname);
	outFs = new FileOutputStream(outFp.getPath());

	// �޸� --> ����
	for (int i=0; i<outH; i++) {
		for (int k=0; k<outW; k++) {
			outFs.write(outImage[i][k]);
		}
	}
	outFs.close();
	out.println("<h1><a href='http://localhost:8080/JSP_Study1/download.jsp?file="
			+OutFname+"'><button>�̹��� �ٿ�ε�</button></a>");
%>
<form form method="post" action="Photo_Client.jsp">
	<p> <input type='submit' value='���� ó�� ȭ������'></p>
</form>
</body>
</html>