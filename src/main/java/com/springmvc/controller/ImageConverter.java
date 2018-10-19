package com.springmvc.controller;


import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.List;

public class ImageConverter {

    private int frame;
    private int width;
    private int height;

    public ImageConverter(List<Integer> dim) {
        // vifeat 是5维
        if (dim.size() == 5) {
            frame = dim.get(1).intValue();
            width = dim.get(2).intValue();
            height = dim.get(3).intValue();
        } else {
            // 其他是3维
            frame = dim.get(0).intValue();
            width = dim.get(1).intValue();
            height = dim.get(2).intValue();
        }
    }

    public void convertToImage(List result, String savepath) {
        //TYPE_BYTE_GRAY 灰度空间是[-0x1000000, -1]的空间， 其中-0x1000000是黑色，-1是白色。0又会变为黑色
        // 要是想输出彩色图像的话就把TYPE_BYTE_GRAY 变成其他类型
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_BYTE_GRAY);
        String type = "jpg";


        for (int f = 0; f < frame; f++) {
            List originData = result.subList(f * width * height, (f + 1) * width * height);
            int[] data = imageSpaceConvert(originData);
            bi.setRGB(0, 0, width, height, data, 0, width);

            // 缩放与插值
            // 需要缩放到的尺寸
            int newWidth = 56;
            int newHeight = 56;
            Image img = bi.getScaledInstance(newWidth, newHeight, Image.SCALE_AREA_AVERAGING);
            BufferedImage scaledImg = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_BYTE_GRAY);
            Graphics g = scaledImg.getGraphics();
            g.drawImage(img, 0, 0, newWidth, newHeight, null);
            g.dispose();
            // 如果不需要缩放功能就把它注释掉，我懒得写成函数了（其实是不会

            File path = new File(savepath);
            if (!path.exists()) {
                path.mkdirs();
            }

            try {
                File file = new File(savepath + f +".jpg");
                // 如果不需要使用到缩放请把 scaledImg 换成 bi
                ImageIO.write(scaledImg, type, file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }

    //将图片灰度正则化后映射到灰度空间
    public int[] imageSpaceConvert(List inputs) {
        int[] output = new int[inputs.size()];

        //normalize
        float max = Float.MIN_VALUE;
        float min = Float.MAX_VALUE;
        float buf;
        for (int i = 0; i < inputs.size(); i++) {
            buf = Float.valueOf(inputs.get(i).toString());
            if (buf > max)
                max = buf;
            if (buf < min)
                min = buf;
        }

        double x;
        for (int i = 0; i < inputs.size(); i++) {
            x = Float.valueOf(inputs.get(i).toString());
            int gray = (int) ((x - min) / (max - min) * 255);
            // 神经元激活部分是白色
            output[i] =  256*(256 * gray + gray) + gray - 0xFFFFFF - 1;
        }
        return output;
    }

}
