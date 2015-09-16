json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :url, :title, :alt
  json.url gallery_url(gallery, format: :json)
end
