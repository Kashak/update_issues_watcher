module UpdateIssuesWatcher
  module RequestSender
    def send_data(issueid)
      uri = URI.parse("https://nodejs-env-kashak-1.c9users.io/")
      data = { data: { issueid: issueid, userid: User.current.id, datetime: DateTime.now.to_s } }.to_json
      req = Net::HTTP::Post.new((uri.path.empty? ? "/" : uri.path), initheader = {'Content-Type' =>'application/json'})
      req.body = data
      http = Net::HTTP.new(uri.hostname, uri.port)
      http.use_ssl = (uri.scheme == "https")
      http.request(req)
    end
  end
end