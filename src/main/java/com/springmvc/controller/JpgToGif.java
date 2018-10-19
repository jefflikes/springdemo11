package com.springmvc.controller;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;

/**
 * Created by jeff on 2018/4/18.
 */
public class JpgToGif{
    public static void main(String[] args) {
        String[] pic = {"D://1.jpg","D://2.jpg","D://3.jpg","D://4.jpg"};
        String newwPic = "D://1.gif";
        int playTime = 200;

    }

    /**
     * 把多张jpg图片合成一张
     * @param pic String[] 多个jpg文件名 包含路径
     * @param newPic String 生成的gif文件名 包含路径
     * @param playTime int 播放的延迟时间
     */
    public synchronized static void jpgToGif(String pic[], String newPic, int playTime) {
        try {
            AnimatedGifEncoder1 e = new AnimatedGifEncoder1();
            e.setRepeat(0);
            e.start(newPic);
            BufferedImage src[] = new BufferedImage[pic.length];
            for (int i = 0; i < src.length; i++) {
                e.setDelay(playTime); //设置播放的延迟时间
                src[i] = ImageIO.read(new File(pic[i])); // 读入需要播放的jpg文件
                e.addFrame(src[i]);  //添加到帧中
            }
            e.finish();
        } catch (Exception e) {
            System.out.println( "jpgToGif Failed:");
            e.printStackTrace();
        }
    }


}