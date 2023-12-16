package data.model.mapper;

import java.util.List;

import data.model.dto.MovieDto;


public interface MovieMapperInter {

	public int getMoiveTotalCount();
	public List<MovieDto> getAllMovies();
	public void insertMovie(MovieDto dto);
	public MovieDto getMovieData(String mv_num);
	public void updateMovie(MovieDto dto);
	public void deleteMovie(String mv_num);
}
