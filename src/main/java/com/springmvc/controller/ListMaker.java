package com.springmvc.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class ListMaker {
	private ArrayList<String> words = new ArrayList<String>();
	
	public void makeList()	{
		
		words.add("<PAD>");
		words.add("<EOS>");
		words.add("<BOS>");
		words.add("<unkown>");
		
		try {
			File file = new File("C:\\Users\\jeff\\IdeaProjects\\springdemo3\\src\\main\\java\\com\\springmvc\\controller\\word_counts.txt");
			BufferedReader reader = new BufferedReader(new FileReader(file));
			String lineWords = null;
			while ((lineWords = reader.readLine()) != null) {
				words.add(lineWords.split(" ")[0]);
			}
			reader.close();
		}catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public String queryByIndex(int[] indexes) 	{
		int i = 0;
		String out = "";
		try {
			while (true) {
				if (indexes[i] > words.size() -1 ) {
					System.out.println("Index out of boundary, no such word.");
					return "";
				}
				out += words.get(indexes[i]) + " ";
				i++;
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			// do nothing
		}
		return out;

	}
	
	public void showAllWords() {
		for (int i = 0; i < words.size(); i++) {
			System.out.println(words.get(i));
		}
	}
	
	
//	public static void main(String[] args) {
//		ListMaker lm = new ListMaker();
//		lm.makeList();
//		int[] indexes = {62, 212, 1, 1};
//		System.out.println(lm.queryByIndex(indexes));
//	}

}
