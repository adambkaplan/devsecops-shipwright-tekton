package hello

import "testing"

func TestSayHello(t *testing.T) {
	expected := "Hello cdcon 2022!"
	actual := SayHello()
	if actual != expected {
		t.Errorf("expected %s, got %s", expected, actual)
	}
}
