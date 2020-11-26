[toc]

Properties

- Stored properties , store constant and variable values. provided  by 
     - classes 
     - structures
- Computed properties,  calculate (rather than store) a value. provided  by 
  - classes 
  - structures
  - enumerations

### Stored Properties

Stored properties can be 

- either variable stored properties , introduced by the ``var`` keyword)
- constant stored properties , introduced by the ``let`` keyword

```swift
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
```

Lazy Stored Properties

indicate a lazy stored property by writing the lazy modifier before its declaration.

```swift
class PropDataManager {
    lazy var importer = PropDataImporter()
    var data = [String]()
    // 代码块只执行一次
    lazy var dataName: String = {
        if data.capacity > 0 {
            return "data is full"
        }
        return "date is empty"
    }()
    init() {
        print("PropDataManager inited")
        print("PropDataManager access importer")
        print("importer file name: " + importer.filename)
        print("dataName : " + dataName)
    }
}
```

### Computed Properties 

Computed Properties provide

- getter
- an optional setter

```swift
struct PropPoint {
    var x = 0.0, y = 0.0
}
struct PropSize {
    var width = 0.0, height = 0.0
}
struct PropRect {
    var origin = PropPoint()
    var size = PropSize()
    var center: PropPoint {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return PropPoint(x: centerX, y: centerY)
        }
        // 推荐使用这种样式
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    
    // readonly computed property
    var area:Double {
        return size.width * size.height
    }
}

struct PropAlternativeRect {
    var origin = PropPoint()
    var size = PropSize()
    var center: PropPoint {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return PropPoint(x: centerX, y: centerY)
        }
        set {
            // 使用newValue
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
```

### Property Observers

You can add property observers in the following places:

- Stored properties that you define

- Stored properties that you inherit

- Computed properties that you inherit

You have the option to define either or both of these observers on a property:

- willSet is called just before the value is stored. with a default parameter name of ``newValue``.

- didSet is called immediately after the new value is stored. with a default parameter name of ``oldValue``

```swift
class PropStepCounter {
    var totalSteps: Int = 0 {       // stored property
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
```

