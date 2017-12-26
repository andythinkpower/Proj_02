package _01_member.model;

import java.sql.Blob;
import java.util.List;
import java.util.Set;

public interface MemberDAO {

	MemberBean select(String memberemail);
	
	MemberBean insert(MemberBean bean);
	
	MemberBean update(MemberBean bean);
	
	Set<EventsBean> showevents(MemberBean bean);
	
	Set<RegionsBean> showregions(MemberBean bean);
	
	Set<EventsBean> insertevents(MemberBean bean, String [] type);
	
	Set<RegionsBean> insertregions(MemberBean bean, String [] region);
	
	Set<EventsBean> deletetypes(MemberBean bean);
	
	Set<RegionsBean> deleteregions(MemberBean bean);
	
	Boolean changepsw(MemberBean bean);
	
}
