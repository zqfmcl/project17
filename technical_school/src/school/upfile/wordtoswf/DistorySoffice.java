package school.upfile.wordtoswf;

import java.io.IOException;
import java.util.Scanner;

public class DistorySoffice {
    private static Process process=null;
    /**
     * 构造方法，实现关闭soffice进程
     */
    public static void turnoffSoffice(){
    	  try {
              //显示进程
              process=Runtime.getRuntime().exec("tasklist");
              Scanner in=new Scanner(process.getInputStream());
              while (in.hasNextLine()) {
                  String processString=in.nextLine();
                  if (processString.contains("soffice.exe")) {
                      //关闭soffice进程的命令
                      String cmd="taskkill /f /im soffice.exe";
                      process=Runtime.getRuntime().exec(cmd);
                      System.out.println("openoffice正常关闭.......");
                  }
              }
          } catch (IOException e) {
              e.printStackTrace();
          }
     }
   }
   
