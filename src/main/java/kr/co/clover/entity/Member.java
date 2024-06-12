package kr.co.clover.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Table(name = "member")
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(nullable = false, unique = true)
	private String userid;
	
	private String password;
	
	@Transient
	private String password2;
	
	private String name;
	private String age;
	private String nation;
	private String religion;
	private String createDate;
	private String updateDate;
	
	@OneToMany(mappedBy = "member", cascade = CascadeType.REMOVE)
	private List<MemberLocation> memberlocationList;
	
	
}
