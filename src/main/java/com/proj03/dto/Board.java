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
public class Board {
	private int bno;
	private String title;
	private String content;
	private String author;
	private int vcnt;
	private String resdate;
}