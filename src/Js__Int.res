module Constants = {
  @inline let minValue = -2147483648
  @inline let maxValue = 2147483647
}

@send external toExponential: int => string = "toExponential"
@send external toExponentialWithPrecision: (int, ~digits: int) => string = "toExponential"

@send external toFixed: int => string = "toFixed"
@send external toFixedWithPrecision: (int, ~digits: int) => string = "toFixed"

@send external toPrecision: int => string = "toPrecision"
@send external toPrecisionWithPrecision: (int, ~digits: int) => string = "toPrecision"

@send external toString: int => string = "toString"
@send external toStringWithRadix: (int, ~radix: int) => string = "toString"
@send external toLocaleString: int => string = "toLocaleString"

@val external fromString: (string, ~radix: @as(json`10`) _) => float = "parseInt"

external toFloat: int => float = "%identity"
external fromFloat: float => int = "%intoffloat"

let fromString = x => {
  let maybeInt = fromString(x)
  if Js__Float.isNaN(maybeInt) {
    None
  } else {
    Some(fromFloat(maybeInt))
  }
}

external mod: (int, int) => int = "%modint"
