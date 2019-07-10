package com.action;

import java.util.Random;

public class RandomNumber {
	private int otp;
	public void genRandom()
	{
	Random rand = new Random();
	int  n = rand.nextInt(8999)+1000;
	System.out.println("the random ramber is ="+n);
	this.otp = n;
	}
	public int getOtp() {
		return otp;
	}
	
	
}
