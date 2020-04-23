package edu.medici.hadoop.airline;

import java.io.IOException;

import javax.xml.soap.Text;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

public class DepartureDelayCount {
	public static void main(String[] args) throws IOException, ClassNotFoundException, InterruptedException {
		Configuration conf = new Configuration();
		
		// 입출력 데이터 경로 확인
		if (args.length !=2) {
			System.err.println("사용법: DepartureDelayCount <input> <output>");
			System.exit(2);
		}
		
		// Job 이름을 설정
		Job job = new Job(conf, "DepartureDalayCount");
		
		// 입출력 데이터 경로 설정
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		// job 클래스 설정
		job.setJarByClass(DepartureDelayCount.class);
		// mapper 클래스 설정
		job.setJarByClass(DepartureDelayCountMapper.class);
		// reducer 클래스 설정
		job.setJarByClass(DelayCountReducer.class);
		
		// 입출력 데이터 포맷 설정
		job.setInputFormatClass(TextInputFormat.class);
		job.setOutputFormatClass(TextOutputFormat.class);
		
		// 출력키 출력 값 유형 설정
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		
		job.waitForCompletion(true);
		}
}
