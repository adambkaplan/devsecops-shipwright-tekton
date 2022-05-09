package hello

import "testing"

func TestSayHello(t *testing.T) {
	expected := "Hello World!"
	actual := SayHello()
	if actual != expected {
		t.Errorf("expected %s, got %s", expected, actual)
	}
}
