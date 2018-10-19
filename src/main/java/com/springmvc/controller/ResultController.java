package com.springmvc.controller;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import io.grpc.StatusRuntimeException;
import org.tensorflow.framework.TensorProto;
import org.tensorflow.framework.TensorShapeProto;
import tensorflow.serving.Model;
import tensorflow.serving.Predict;
import tensorflow.serving.PredictionServiceGrpc;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 * Created by jeff on 2018/4/9.
 */

public class ResultController {
    private static final Logger logger = Logger.getLogger( ResultController.class.getName());
    private final ManagedChannel channel;
    private final PredictionServiceGrpc.PredictionServiceBlockingStub blockingStub;

    // Initialize gRPC client

    public  ResultController(String host, int port) {
        channel = ManagedChannelBuilder.forAddress(host, port)
                // Channels are secure by default (via SSL/TLS). For the example we disable TLS to avoid
                .usePlaintext(true)
                .build();
        blockingStub = PredictionServiceGrpc.newBlockingStub(channel);
    }
    public static void main(String[] args) {
        System.out.println("Start the predict client");

        String host = "10.108.102.210";//服务器地址
        int port = 9000;
        String modelName = "test410";//模型名字
        long modelVersion = 1;//模型版本号

        // Parse command-line arguments
        if (args.length == 4) {
            host = args[0];
            port = Integer.parseInt(args[1]);
            modelName = args[2];
            modelVersion = Long.parseLong(args[3]);
        }

        // Run predict client to send request
        ResultController client = new  ResultController(host, port);

        try {
            client.do_predict(modelName, modelVersion);
            System.out.println("Success!");
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Fail to predict");
        } finally {
            try {
                client.shutdown();
                System.out.println("Client shutdown");
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        System.out.println("End of predict client");
    }

    public void shutdown() throws InterruptedException {
        channel.shutdown().awaitTermination(5, TimeUnit.SECONDS);
    }


    public void do_predict(String modelName, long modelVersion) {

//获取图片个数

        String Filename = "D:/cutOutput/1.mp4";//放裁剪好的图片的文件夹
        List<String> Filenames = new ArrayList();
        File file = new File(Filename);
        String[] filenames = file.list();

        //图片长度
/*        int[] keysTensorData = new int[]{filenames.length};
        TensorProto.Builder keysTensorBuilder = TensorProto.newBuilder();
        for (int i = 0; i < keysTensorData.length; ++i) {
            keysTensorBuilder.addIntVal(keysTensorData[i]);
        }
        keysTensorBuilder.setDtype(org.tensorflow.framework.DataType.DT_INT32);
        TensorProto keysTensorProto = keysTensorBuilder.build();*/
// Generate keys TensorProto
        int keysTensorData = filenames.length;
        TensorProto.Builder keysTensorBuilder = TensorProto.newBuilder();
        keysTensorBuilder.addIntVal(keysTensorData);
        keysTensorBuilder.setDtype(org.tensorflow.framework.DataType.DT_INT32);
        TensorProto keysTensorProto = keysTensorBuilder.build();


        // Generate image file to array生成图像序列
/*        int [][][][][] featuresTensorData = new int[1][filenames.length][112][112][3];


        for (int i = 0; i < filenames.length; i++){
            Filenames.add(Filename + "/" + filenames[i]);
        }
        String[] imageFilenames = (String[])Filenames.toArray(new String[Filenames.size()]);
        for(int x = 0; x < featuresTensorData.length; x++){
            for (int i = 0; i < imageFilenames.length; i++) {

                //   image file to multi-dimension array
                File imageFile = new File(imageFilenames[i]);
                try {
                    BufferedImage image = ImageIO.read(imageFile);
                    logger.info("Start to convert the image: " + imageFile.getPath());

                    int imageWidth = 112;
                    int imageHeight = 112;
                    int[][] imageArray = new int[imageHeight][imageWidth];
                    for (int row = 0; row < imageHeight; row++) {
                        for (int column = 0; column < imageWidth; column++) {
                            imageArray[row][column] = image.getRGB(column, row);
                            int pixel = image.getRGB(column, row);
                            int red = (pixel >> 16) & 0xff;
                            int green = (pixel >> 8) & 0xff;
                            int blue = pixel & 0xff;
                            *//*unsigned long uColor;    // #AARRGGBB format

                            float fAlpha = (float)(uColor >> 24) / 0xFF
                            float red = (float)((uColor >> 16) & 0xFF) / 0xFF;
                            float green = (float)((uColor >> 8) & 0xFF) / 0xFF;
                            float blue = (float)(uColor & 0xFF) / 0xFF;*//*
                            featuresTensorData[x][i][row][column][0] = red;
                            featuresTensorData[x][i][row][column][1] = green;
                            featuresTensorData[x][i][row][column][2] = blue;
                        }
                    }
                } catch (IOException e) {
                    logger.log(Level.WARNING, e.getMessage());
                    System.exit(1);
                }
            }
        }*/
        //生成图像序列
        float[][][][][] featuresTensorData = new float[1][filenames.length][112][112][3];
        for (int i = 0; i < filenames.length; i++) {
            Filenames.add(Filename + "/" + filenames[i]);
        }
        String[] imageFilenames = (String[]) Filenames.toArray(new String[Filenames.size()]);
        for (int x = 0; x < featuresTensorData.length; x++) {
            for (int i = 0; i < imageFilenames.length; i++) {

                //   image file to multi-dimension array
                File imageFile = new File(imageFilenames[i]);
                try {
                    BufferedImage image = ImageIO.read(imageFile);
                    logger.info("Start to convert the image: " + imageFile.getPath());

                    int imageWidth = 112;
                    int imageHeight = 112;
                    float half = 0.5F;
                    int[][] imageArray = new int[imageHeight][imageWidth];
                    for (int row = 0; row < imageHeight; row++) {
                        for (int column = 0; column < imageWidth; column++) {
                            imageArray[row][column] = image.getRGB(column, row);
                            int pixel = image.getRGB(column, row);
                            /*int red = (pixel >> 16) & 0xff;
                            int green = (pixel >> 8) & 0xff;
                            int blue = pixel & 0xff;*/
//                            float fAlpha = (float)(pixel >> 24) / 0xFF;
                            float red = (float) ((pixel >> 16) & 0xFF) / 0xFF;
                            float green = (float) ((pixel >> 8) & 0xFF) / 0xFF;
                            float blue = (float) (pixel & 0xFF) / 0xFF;
                            featuresTensorData[x][i][row][column][0] = (red - half) * 2;
                            featuresTensorData[x][i][row][column][1] = (green - half) * 2;
                            featuresTensorData[x][i][row][column][2] = (blue - half) * 2;//图片预处理
                        }
                    }
                } catch (IOException e) {
                    logger.log(Level.WARNING, e.getMessage());
                    System.exit(1);
                }
            }
        }
//生成tensorproto 用于gRPC传输
        // Generate features TensorProto
        TensorProto.Builder featuresTensorBuilder = TensorProto.newBuilder();
        for (int x = 0; x < featuresTensorData.length; ++x) {
            for (int i = 0; i < featuresTensorData[x].length; ++i) {
                for (int j = 0; j < featuresTensorData[x][i].length; ++j) {
                    for (int k = 0; k < featuresTensorData[x][i][j].length; ++k) {
                        for (int l = 0; l < featuresTensorData[x][i][j][k].length; ++l) {
                            featuresTensorBuilder.addFloatVal(featuresTensorData[x][i][j][k][l]);
                        }
                    }
                }
            }
        }
        TensorShapeProto.Dim featuresDim0 = TensorShapeProto.Dim.newBuilder().setSize(1).build();
        TensorShapeProto.Dim featuresDim1 = TensorShapeProto.Dim.newBuilder().setSize(filenames.length).build();
        TensorShapeProto.Dim featuresDim2 = TensorShapeProto.Dim.newBuilder().setSize(112).build();
        TensorShapeProto.Dim featuresDim3 = TensorShapeProto.Dim.newBuilder().setSize(112).build();
        TensorShapeProto.Dim featuresDim4 = TensorShapeProto.Dim.newBuilder().setSize(3).build();
        TensorShapeProto featuresShape = TensorShapeProto.newBuilder().addDim(featuresDim0).addDim(featuresDim1).addDim(featuresDim2).addDim(featuresDim3).addDim(featuresDim4).build();
        featuresTensorBuilder.setDtype(org.tensorflow.framework.DataType.DT_FLOAT).setTensorShape(featuresShape);
        TensorProto featuresTensorProto = featuresTensorBuilder.build();


        // Generate gRPC request
        com.google.protobuf.Int64Value version = com.google.protobuf.Int64Value.newBuilder().setValue(modelVersion).build();
        Model.ModelSpec modelSpec = Model.ModelSpec.newBuilder().setName(modelName).setVersion(version).setSignatureName("predict_image").build();
        Predict.PredictRequest request = Predict.PredictRequest.newBuilder().setModelSpec(modelSpec).putInputs("img", featuresTensorProto).putInputs("img_length", keysTensorProto).build();

        // Request gRPC server
        Predict.PredictResponse response;
        try {
            System.out.println("request");
            response = blockingStub.predict(request);
            System.out.println("send request");
            java.util.Map<java.lang.String, org.tensorflow.framework.TensorProto> outputs = response.getOutputs();
            System.out.println("get output");
            /*for (java.util.Map.Entry<java.lang.String, org.tensorflow.framework.TensorProto> entry : outputs.entrySet()) {
                System.out.println("Response with the key: " + entry.getKey() + ", value: " + entry.getValue());
            }*/
            Change_result(outputs.get("prediction"), "prediction");
            Visualization_data(outputs.get("vifeat"), "vifeat");
            Visualization_data(outputs.get("reinputs"), "reinputs");
            Visualization_data(outputs.get("bl_layer1"), "bl_layer1");
            Visualization_data(outputs.get("bl_layer2"), "bl_layer2");
            Visualization_data(outputs.get("bl_layer3"), "bl_layer3");
            Visualization_data(outputs.get("en_out"), "en_out");
            Visualization_data(outputs.get("out_prob"), "out_prob");
            Visualization_data(outputs.get("out_idx"), "out_idx");

        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC failed: {0}", e.getStatus());
            return;
        }
    }
    //判断数据维度
    public List Dimcount(org.tensorflow.framework.TensorProto res){
        List<Integer> dim = new ArrayList<Integer>();
        for (int i = 0; i < res.getTensorShape().getDimCount(); i++){
            String s = res.getTensorShape().getDim(i).toString();
            s = s.replace("\n"," ");
            s = s.split(" ")[1];

            int d = Integer.parseInt(s);
            dim.add(d);
        }
        return dim;
    }

    //预测结果处理
    /*    说明：
          结果存在了result里面 可以调用Dimcount获得维度信息 但是好像不需要
          */
    // TODO: 2018/4/11 将result里面的数字过字典变成汉字
    // TODO: 2018/4/11 将汉字传回到页面上
    public void Change_result(org.tensorflow.framework.TensorProto res, String name){

        List<Integer> result = new ArrayList<Integer>();
        result = res.getIntValList();

    }

    //可视化输入数据处理
    /*    说明：
          1是float 3是int
          结果存在result里面  都在if函数里面声明的 只能在if里面调用result  如果想外面用吧声明挪到外面去
    */
    // TODO: 2018/4/11  将result里面存的数据加上维度信息dim列表  转化保存成mat数据包
    public void Visualization_data(org.tensorflow.framework.TensorProto res, String name){
        List<Integer> dim = new ArrayList<Integer>();
        dim = Dimcount(res);

        System.out.println(dim);
        if(res.getDtypeValue() == 1){
            List<Float> result = new ArrayList<Float>();
            result = res.getFloatValList();

        }
        else if(res.getDtypeValue() == 3){
            List<Integer> result = new ArrayList<Integer>();
            result = res.getIntValList();
        }

    }


    private void Change_result() {
    }

}