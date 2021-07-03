class GistQuestionService
  ResponseObject = Struct.new(:success?, :html_url)

  def initialize(question)
    @question = question
    @test = @question.test
    @client = http_client
  end

  def call
    response = @client.create_gist(gist_params)
    ResponseObject.new(response.html_url.present?, response.html_url)
  end

  private

  def http_client
    Octokit::Client.new(access_token: Rails.application.credentials.github[:access_token])
  end

  def gist_params
    {
      description: I18n.t('gist.description', title: @test.title),
      files: {
        I18n.t('gist.file_name') => {
          content: gist_content
        }
      },
      public: true
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
