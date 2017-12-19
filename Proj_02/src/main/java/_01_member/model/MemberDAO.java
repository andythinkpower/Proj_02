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
	
	Set<EventsBean> insertevents(Set<EventsBean> eventsbean);
	
	Set<RegionsBean> insertregions(Set<RegionsBean> regionsbean);
	
	Set<EventsBean> deleteevents(MemberBean bean);
	
	Set<RegionsBean> deleteregions(MemberBean bean);
	
}
