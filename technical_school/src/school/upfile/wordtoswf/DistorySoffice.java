package school.upfile.wordtoswf;

import java.io.IOException;
import java.util.Scanner;

public class DistorySoffice {
    private static Process process=null;
    /**
     * ���췽����ʵ�ֹر�soffice����
     */
    public static void turnoffSoffice(){
    	  try {
              //��ʾ����
              process=Runtime.getRuntime().exec("tasklist");
              Scanner in=new Scanner(process.getInputStream());
              while (in.hasNextLine()) {
                  String processString=in.nextLine();
                  if (processString.contains("soffice.exe")) {
                      //�ر�soffice���̵�����
                      String cmd="taskkill /f /im soffice.exe";
                      process=Runtime.getRuntime().exec(cmd);
                      System.out.println("openoffice�����ر�.......");
                  }
              }
          } catch (IOException e) {
              e.printStackTrace();
          }
     }
   }
   
