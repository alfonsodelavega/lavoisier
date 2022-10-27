package es.unican.istr.lavoisier.generator

class ValueWrapper {

  Object value

  new (Object value) {
    this.value = value;
  }

  def Object get() {
    return value;
  }

  def void set(Object value) {
    this.value = value;
  }

  override String toString() {
    if (value === null) "" else value.toString()
  }
}
