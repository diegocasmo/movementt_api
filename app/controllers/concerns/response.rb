module Response
  def json_response(res, status = :ok)
    render(json: res, status: status)
  end
end
