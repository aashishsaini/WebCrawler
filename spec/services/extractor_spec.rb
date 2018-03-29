RSpec.describe Extractor, :type => :service  do
  it "returns a scraped html" do
    fake_html = <<-EOS
    <!doctype html>
    <html>
      <head>
        <title>ABC</title>
      </head>
      <body>
        <div>
          <h1>XYZ</h1>
          <h2>Sample text</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
             labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
             laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate 
             velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in 
             culpa qui officia deserunt mollit anim id est laborum..
          </p>
          <p>
            <a href="https://www.lipsum.com/">See More..</a>
          </p>
        </div>
      </body>
    </html>
    EOS

    scrap = {
      "a"=>['https://www.lipsum.com/'],
      "h1"=>['XYZ'],
      "h2"=>['Sample text'],
      "h3"=>[]
    }
    Extractor.any_instance.stubs(:page).returns(fake_html)

    expect(Extractor.new('http://google.com').call.to_hash['a']).to eq(scrap['a'])
    expect(Extractor.new('http://google.com').call.to_hash['h1']).to eq(scrap['h1'])
    expect(Extractor.new('http://google.com').call.to_hash['h2']).to eq(scrap['h2'])
  end
end
