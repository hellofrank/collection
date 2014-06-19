require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.hua-kuohao.com'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.sitemaps_host = ENV['SITEMAP_HOST']
#SitemapGenerator::Sitemap.public_path = 'tmp/'
#SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
	#add '/articles', :changefreq => 'daily', :priority => 0.9
  Article.find_each do |article|
    add article_path(article), lastmod: article.updated_at
  end
end

#SitemapGenerator::Sitemap.ping_search_engines

