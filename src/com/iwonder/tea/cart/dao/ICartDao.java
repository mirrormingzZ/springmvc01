package com.iwonder.tea.cart.dao;

import java.util.ArrayList;

import com.iwonder.tea.cart.entity.Cart;
import com.iwonder.tea.cart.view.CartConditionView;
import com.iwonder.tea.cart.view.CartQueryView;

public interface ICartDao {

	public ArrayList<CartQueryView> list(CartConditionView cartConditionView);

	public void delete(String cartId);

	public void insert(Cart cart);

	public void update(Cart cart);

	public Cart load(String cartId);

	public ArrayList<CartQueryView> list(String userId);

	public void update(String cartId, String quality);

	public CartQueryView loadCart(String cartId);

}
