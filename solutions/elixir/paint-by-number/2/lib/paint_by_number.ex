defmodule PaintByNumber do
  def palette_bit_size(color_count) when color_count <= 2 do
    1
  end

  def palette_bit_size(color_count) do
    1 + palette_bit_size(div(color_count - 1, 2) + 1)
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, _color_count) when picture == <<>> do
    nil
  end

  def get_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)
    <<first_pixel::size(palette_bit_size), _::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(picture, _color_count) when picture == <<>> do
    <<>>
  end

  def drop_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)
    <<_::size(palette_bit_size), tail::bitstring>> = picture
    tail
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
