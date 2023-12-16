package mycar.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Table(name = "mycar")  //자동으로 mycar 테이블 mysql에 생성
@Data
public class MyCarDto {
	
	@Id //각 entitiy를 구별할수있는 식별id를 갖도록 설계(시퀀스) //기본키 
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;  
	
	@Column(name="carname")
	private String carname;
	
	@Column //이름같으면 생략가능
	private int carprice;
	
	@Column
	private String carcolor;
	
	@Column
	private String carguip;
	
	@Column
	private String carphoto;
	
	@CreationTimestamp  //entitiy가 생성되는 시점의 시간 자동등록
	@Column(updatable = false) //수정시 이컬럼은 수정하지 않겠다
	//updatable = false 없을시 날짜가 null로 찍힐것
	private Timestamp guipday;
}
