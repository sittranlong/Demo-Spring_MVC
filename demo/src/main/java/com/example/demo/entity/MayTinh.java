package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.UUID;

@Entity
@Table(name = "may_tinh")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class MayTinh {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id")
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "hang_id", referencedColumnName = "id")
    private Hang hang;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ten_may_tinh")
    private String tenMayTinh;

    @Column(name = "gia")
    private Float gia;

    @Column(name = "mau_sac")
    private String mauSac;

    @Column(name = "mieu_ta")
    private String mieuTa;

    @Column(name = "bo_nho")
    private String boNho;

}
