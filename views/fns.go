package views

func ternary(vt interface{}, vf interface{}, v bool) interface{} {
	if v {
		return vt
	}

	return vf
}

func hasKey(d map[string]interface{}, key string) bool {
	_, ok := d[key]
	return ok
}

func valueOr(vt interface{}, vf interface{}) interface{} {
	if vf != nil {
		return vf
	}
	return vt
}

func valueOrEmpty(vf interface{}) interface{} {
	if vf != nil {
		return vf
	}
	return ""
}

func derefStr(str *string) string {
	return *str
}

func stringMap() (s map[string]string) {
	return
}
