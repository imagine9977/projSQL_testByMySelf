package com.proj03.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Fileboard {
	private int no;
	private String title;
	private String content;
	private String url;
	private int hits;
	private String resdate;
	private String author;
}
