package com.meliora.model;

import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;

public class BaseEntity implements Serializable, Cloneable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public Object clone() throws CloneNotSupportedException {
		try {
			return BeanUtils.cloneBean(this);
		} catch (Exception e) {
			throw new CloneNotSupportedException(e.getMessage());
		}
	}
	

}
