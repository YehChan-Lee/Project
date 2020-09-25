package com.javaex.model;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDao {

   @Autowired
   private SqlSession sqlSession;
   
   public ReservationDao(SqlSession sqlsession) {
      this.sqlSession = sqlsession;
   }
   
   public ReservationVo user_reserve(String user_email) {
      return sqlSession.selectOne(user_email);
   }
   
   public List<ReservationVo> getAll_shopId(String shop_id) {
	  return sqlSession.selectList("Reservation.getAll_shopId",shop_id);
   }
   
   public void updateAlertNew_shopId(String shop_id) {
	  sqlSession.update("Reservation.updateAlertNew_shopId", shop_id);
   }

   public void insert_reservation(ReservationVo vo) {
      sqlSession.insert("Reservation.insertReservation", vo);
   }
   public List<ReservationVo> reservationOne(String shop_id){
		return sqlSession.selectList("Reservation.reservationOne", shop_id);
	}

}