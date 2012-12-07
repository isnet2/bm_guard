package com.isnetis.device.controller;

public class TEST0001 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String arr="'그룹1,300.0,2.0,ROOT,100.0,COM-01,'^',그룹1,300.0,2.0,ROOT,100.0,COM-02,'^',그룹1,300.0,2.0,ROOT,100.0,COM-03,'^',그룹1,300.0,2.0,ROOT,100.0,COM-04,'^',그룹1,300.0,2.0,ROOT,100.0,COM-05,'^',그룹2,400.0,2.0,ROOT,100.0,COM-06,'^',그룹2,400.0,2.0,ROOT,100.0,COM-07,'^'";
		String [] array = arr.split("\\^");
		for(int i = 0 ; i < array.length;i++) {
			System.out.println(array[i]);
		}
	}

}
