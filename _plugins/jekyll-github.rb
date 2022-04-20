require 'open-uri'
require 'pp'

module Jekyll
    class GithubGenerator < Jekyll::Generator
        def generate(site)
			github_api_info = ""
			if site.config.key?("github_token")
				github_api_info = "With authentication\n"
				URI.open('https://api.github.com/repos/jekyll/jekyll', "Authorization" => "Bearer #{site.config['github_token']}"){|f|
					github_api_info += f.meta.pretty_inspect
				}
			else
				github_api_info = "Without authentication\n"
				URI.open('https://api.github.com/repos/jekyll/jekyll'){|f|
					github_api_info += f.meta.pretty_inspect
				}
			end
            site.config['github_api_info'] = github_api_info
        end
    end
end
