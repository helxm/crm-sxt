package com.bjsxt.crm.util;

import java.util.ArrayList;
import java.util.HashSet;

public class RemoveDuplicate {
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void removeDuplicate(ArrayList<Integer> menuIds) {
	      HashSet h = new HashSet(menuIds);
	      menuIds.clear();
	      menuIds.addAll(h);
	      System.out.println(menuIds);
	}
}
