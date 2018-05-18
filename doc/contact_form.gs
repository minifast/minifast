function NamedValuesTransformer(name, fields) {
  this.name = name
  this.fields = fields
}

NamedValuesTransformer.prototype.toAttachment = function() {
  var self = this
  var fields = Object.keys(this.fields).map(function(key) { return new FieldTransformer(key, self.fields[key]).toField() })
  return({fallback: "New Google Forms Contact", title: this.name, fields: fields})
}

function FieldTransformer(name, values) {
  this.name = name
  this.values = values
}

FieldTransformer.prototype.toField = function() {
  return {title: this.name, value: this.values[0]}
}

function TriggerTransformer(trigger) {
  this.trigger = trigger
}

TriggerTransformer.prototype.toSlack = function() {
  var attachment = new NamedValuesTransformer("New Contact", this.trigger.namedValues).toAttachment()
  return {attachments: [attachment]}
}

function SlackPoster(url, fetcher) {
  this.fetcher = fetcher
  this.url = url
}

SlackPoster.prototype.getFetcher = function() {
  return this.fetcher || UrlFetchApp
}

SlackPoster.prototype.postContact = function(event) {
  var transformer = new TriggerTransformer(event)
  var message = transformer.toSlack()
  var payload = JSON.stringify(message)
  var options = {method: 'POST', payload: payload}
  this.getFetcher().fetch(this.url, options)
}

function postContact(event) {
  var poster = new SlackPoster('http://example.com')
  poster.postContact(event)
}


/*******************************************************/

function NotExpectation(actual) {
  this.actual = actual
}

NotExpectation.prototype.toEqual = function(expected) {
  if (expected == this.actual) {
    var error = new Error(["Expected", this.actual, "not to equal", expected].join(" "))
    throw(error)
  }
}

function Expectation(actual) {
  this.actual = actual
  this.not = new NotExpectation(actual)
}

Expectation.prototype.toEqual = function(expected) {
  if (expected != this.actual) {
    var error = new Error(["Expected", this.actual, "to equal", expected].join(" "))
    throw(error)
  }
}

function Example(name, block) {
  this.name = name
  this.block = block
}

Example.prototype.run = function() {
  var start = new Date()
  var result = null
  try { this.block() } catch(e) { result = e }
  return [this.name, new Date() - start, result]
}

function suite() {
  var examples = []
  var exampleScope = []

  function describe(name, block) {
    exampleScope.push(name)
    block.call()
    exampleScope.pop()
  }

  function it(name, block) {
    examples.push(new Example(exampleScope.concat([name]).join(" "), block))
  }

  function expect(actual) {
    var expectation = new Expectation(actual)
    return expectation
  }

  describe("NamedValuesTransformer", function() {
    describe("#toAttachment", function(){
      it("turns namedValues into attachments", function(){
        var transformer = new NamedValuesTransformer("New Contact", {ham: ["gross"]})
        expect(JSON.stringify(transformer.toAttachment())).toEqual(JSON.stringify({fallback: "New Google Forms Contact", title: "New Contact", fields: [{title: "ham", value: "gross"}]}))
      })
    })
  })

  describe("FieldTransformer", function() {
    describe("#toField", function() {
      it("turns keys and values into fields", function(){
        var transformer = new FieldTransformer("ham", ["gross"])
        expect(JSON.stringify(transformer.toField())).toEqual(JSON.stringify({title: "ham", value: "gross"}))
      })
    })
  })

  describe("TriggerTransformer", function() {
    describe("#toSlack", function() {
      it("turns a trigger into a postable slack body", function(){
        var transformer = new TriggerTransformer({namedValues: {ham: ["gross"]}})
        expect(JSON.stringify(transformer.toSlack())).toEqual(JSON.stringify({attachments: [{fallback: "New Google Forms Contact", title: "New Contact", fields: [{title: "ham", value: "gross"}]}]}))
      })
    })
  })

  describe("SlackPoster", function() {
    describe("#getFetcher", function(){
      describe("when there is no fetcher provided", function(){
        it("returns the UrlFetcherApp", function(){
          var poster = new SlackPoster()
          expect(poster.getFetcher()).toEqual(UrlFetchApp)
        })
      })

      describe("when there is a fetcher provided", function(){
        it("returns the fake fetcher", function(){
          var fakeFetcher = {}
          var poster = new SlackPoster("http://example.com", fakeFetcher)
          expect(poster.getFetcher()).toEqual(fakeFetcher)
        })
      })
    })

    describe("#postContact", function(){
      it("posts the contact using the fetcher", function(){
        var calls = []
        var fakeFetcher = {fetch: function(url, options){ calls.push([url, options]) }}
        var poster = new SlackPoster("http://example.com", fakeFetcher)
        poster.postContact({namedValues: {ham: ["gross"]}})
        expect(calls.length).toEqual(1)
      })
    })
  })

  var results = examples.map(function(example) { return example.run() })
  Logger.log(results.map(function(result){ return (result[2] === null) ? "." : "F" }).join(""))
  if (results.filter(function (result){ result[2] !== null }).length > 0) {
    Logger.log("Errors:\n" + results.map(function(result) {
      if (result[2] !== null) {
        return [result[0], ":\n\t", result[2], "\n\tin ", result[1], "s\n", result[1].stack].join("")
      }
    }).join(""))
  } else {
    Logger.log("Passed")
  }
}
