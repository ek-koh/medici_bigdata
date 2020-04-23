package edu.medici.hadoop.airline;

import java.io.IOException;

import javax.imageio.IIOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class DepartureDelayCountMapper extends Mapper<LongWritable, Text, Text, IntWritable>{
	// map 출력값
	private final static IntWritable outputValue = new IntWritable();
	
	// map 출력키
	private Text outputKey = new Text();
	
	public void map(LongWritable key, Text value, Context context) throws InterruptedException, IOException{
		Airline parser = new Airline(value);
		
		// 출력 키 설정
		outputKey.set(parser.getYear()+" "+parser.getMonth());
		
		if (parser.getDepDelay() > 0) {
			// 출력 데이터 생성
			context.write(outputKey, outputValue);
		}
	}
}
