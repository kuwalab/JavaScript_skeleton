bar = require '../coffee/bar.coffee'
$ = require 'jquery'

suite 'mochaのテスト', ->
  setup ->
    document.body.innerHTML = __html__['test/fixture/test.html'];

  teardown ->
    document.body.innerHTML = ''

  test '1 + 1は2になること', ->
    assert.ok bar.add(1, 1), 3
    assert.ok $('#my-fixture').html(), 'DOMのテスト'
