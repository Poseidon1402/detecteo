# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.

# SnakeYAML - Dontwarn java.beans classes (not available on Android)
-dontwarn java.beans.BeanInfo
-dontwarn java.beans.FeatureDescriptor
-dontwarn java.beans.IntrospectionException
-dontwarn java.beans.Introspector
-dontwarn java.beans.PropertyDescriptor

# Keep SnakeYAML classes
-keep class org.yaml.snakeyaml.** { *; }
-dontwarn org.yaml.snakeyaml.**