package boot.data.service;

import java.util.List;

import boot.data.dto.ShopDto;

public interface ShopServiceInter {

	public void insertShop(ShopDto dto);
	public List<ShopDto> getShopDataes();
	public ShopDto getData(int num);
	public void deleteShop(int num);
}
