/*

Copyright 2008-2011 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.

pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

$Revision$
$Date$
$Author$
$HeaderURL$

*/
%{
#include <Aspect_Array1OfEdge.hxx>
#include <Aspect_AspectFillArea.hxx>
#include <Aspect_AspectFillAreaDefinitionError.hxx>
#include <Aspect_AspectLine.hxx>
#include <Aspect_AspectLineDefinitionError.hxx>
#include <Aspect_AspectMarker.hxx>
#include <Aspect_AspectMarkerDefinitionError.hxx>
#include <Aspect_Background.hxx>
#include <Aspect_BadAccess.hxx>
#include <Aspect_CLayer2d.hxx>
#include <Aspect_CardinalPoints.hxx>
#include <Aspect_CircularGrid.hxx>
#include <Aspect_ColorCubeColorMap.hxx>
#include <Aspect_ColorMap.hxx>
#include <Aspect_ColorMapDefinitionError.hxx>
#include <Aspect_ColorMapEntry.hxx>
#include <Aspect_ColorPixel.hxx>
#include <Aspect_ColorRampColorMap.hxx>
#include <Aspect_ColorScale.hxx>
#include <Aspect_Convert.hxx>
#include <Aspect_Display.hxx>
#include <Aspect_Drawable.hxx>
#include <Aspect_Driver.hxx>
#include <Aspect_DriverDefinitionError.hxx>
#include <Aspect_DriverError.hxx>
#include <Aspect_DriverPtr.hxx>
#include <Aspect_Edge.hxx>
#include <Aspect_EdgeDefinitionError.hxx>
#include <Aspect_FStream.hxx>
#include <Aspect_FillMethod.hxx>
#include <Aspect_FontMap.hxx>
#include <Aspect_FontMapDefinitionError.hxx>
#include <Aspect_FontMapEntry.hxx>
#include <Aspect_FontStyle.hxx>
#include <Aspect_FontStyleDefinitionError.hxx>
#include <Aspect_FormatOfSheetPaper.hxx>
#include <Aspect_GenId.hxx>
#include <Aspect_GenericColorMap.hxx>
#include <Aspect_GradientBackground.hxx>
#include <Aspect_GradientFillMethod.hxx>
#include <Aspect_GraphicCallbackProc.hxx>
#include <Aspect_GraphicDevice.hxx>
#include <Aspect_GraphicDeviceDefinitionError.hxx>
#include <Aspect_GraphicDriver.hxx>
#include <Aspect_Grid.hxx>
#include <Aspect_GridDrawMode.hxx>
#include <Aspect_GridType.hxx>
#include <Aspect_Handle.hxx>
#include <Aspect_HatchStyle.hxx>
#include <Aspect_IFStream.hxx>
#include <Aspect_IdentDefinitionError.hxx>
#include <Aspect_IndexPixel.hxx>
#include <Aspect_InteriorStyle.hxx>
#include <Aspect_LineStyle.hxx>
#include <Aspect_LineStyleDefinitionError.hxx>
#include <Aspect_LineWidthDefinitionError.hxx>
#include <Aspect_ListingType.hxx>
#include <Aspect_MarkMap.hxx>
#include <Aspect_MarkMapDefinitionError.hxx>
#include <Aspect_MarkMapEntry.hxx>
#include <Aspect_MarkerStyle.hxx>
#include <Aspect_MarkerStyleDefinitionError.hxx>
#include <Aspect_PixMap.hxx>
#include <Aspect_Pixel.hxx>
#include <Aspect_PixmapDefinitionError.hxx>
#include <Aspect_PixmapError.hxx>
#include <Aspect_PlotMode.hxx>
#include <Aspect_PlotterOrigin.hxx>
#include <Aspect_PolyStyleDefinitionError.hxx>
#include <Aspect_PolygonOffsetMode.hxx>
#include <Aspect_RGBPixel.hxx>
#include <Aspect_RectangularGrid.hxx>
#include <Aspect_RenderingContext.hxx>
#include <Aspect_SequenceNodeOfSequenceOfColor.hxx>
#include <Aspect_SequenceNodeOfSequenceOfColorMapEntry.hxx>
#include <Aspect_SequenceNodeOfSequenceOfFontMapEntry.hxx>
#include <Aspect_SequenceNodeOfSequenceOfMarkMapEntry.hxx>
#include <Aspect_SequenceNodeOfSequenceOfTypeMapEntry.hxx>
#include <Aspect_SequenceNodeOfSequenceOfWidthMapEntry.hxx>
#include <Aspect_SequenceOfColor.hxx>
#include <Aspect_SequenceOfColorMapEntry.hxx>
#include <Aspect_SequenceOfFontMapEntry.hxx>
#include <Aspect_SequenceOfMarkMapEntry.hxx>
#include <Aspect_SequenceOfTypeMapEntry.hxx>
#include <Aspect_SequenceOfWidthMapEntry.hxx>
#include <Aspect_TypeMap.hxx>
#include <Aspect_TypeMapDefinitionError.hxx>
#include <Aspect_TypeMapEntry.hxx>
#include <Aspect_TypeOfColorMap.hxx>
#include <Aspect_TypeOfColorScaleData.hxx>
#include <Aspect_TypeOfColorScaleOrientation.hxx>
#include <Aspect_TypeOfColorScalePosition.hxx>
#include <Aspect_TypeOfColorSpace.hxx>
#include <Aspect_TypeOfConstraint.hxx>
#include <Aspect_TypeOfDeflection.hxx>
#include <Aspect_TypeOfDegenerateModel.hxx>
#include <Aspect_TypeOfDisplayText.hxx>
#include <Aspect_TypeOfDrawMode.hxx>
#include <Aspect_TypeOfEdge.hxx>
#include <Aspect_TypeOfFacingModel.hxx>
#include <Aspect_TypeOfFont.hxx>
#include <Aspect_TypeOfHighlightMethod.hxx>
#include <Aspect_TypeOfLayer.hxx>
#include <Aspect_TypeOfLine.hxx>
#include <Aspect_TypeOfMarker.hxx>
#include <Aspect_TypeOfPrimitive.hxx>
#include <Aspect_TypeOfRenderingMode.hxx>
#include <Aspect_TypeOfResize.hxx>
#include <Aspect_TypeOfStyleText.hxx>
#include <Aspect_TypeOfText.hxx>
#include <Aspect_TypeOfTriedronEcho.hxx>
#include <Aspect_TypeOfTriedronPosition.hxx>
#include <Aspect_TypeOfUpdate.hxx>
#include <Aspect_UndefinedMap.hxx>
#include <Aspect_Units.hxx>
#include <Aspect_WidthMap.hxx>
#include <Aspect_WidthMapDefinitionError.hxx>
#include <Aspect_WidthMapEntry.hxx>
#include <Aspect_WidthOfLine.hxx>
#include <Aspect_Window.hxx>
#include <Aspect_WindowDefinitionError.hxx>
#include <Aspect_WindowDriver.hxx>
#include <Aspect_WindowDriverPtr.hxx>
#include <Aspect_WindowError.hxx>
#include <Handle_Aspect_AspectFillArea.hxx>
#include <Handle_Aspect_AspectFillAreaDefinitionError.hxx>
#include <Handle_Aspect_AspectLine.hxx>
#include <Handle_Aspect_AspectLineDefinitionError.hxx>
#include <Handle_Aspect_AspectMarker.hxx>
#include <Handle_Aspect_AspectMarkerDefinitionError.hxx>
#include <Handle_Aspect_BadAccess.hxx>
#include <Handle_Aspect_CircularGrid.hxx>
#include <Handle_Aspect_ColorCubeColorMap.hxx>
#include <Handle_Aspect_ColorMap.hxx>
#include <Handle_Aspect_ColorMapDefinitionError.hxx>
#include <Handle_Aspect_ColorRampColorMap.hxx>
#include <Handle_Aspect_ColorScale.hxx>
#include <Handle_Aspect_Driver.hxx>
#include <Handle_Aspect_DriverDefinitionError.hxx>
#include <Handle_Aspect_DriverError.hxx>
#include <Handle_Aspect_EdgeDefinitionError.hxx>
#include <Handle_Aspect_FontMap.hxx>
#include <Handle_Aspect_FontMapDefinitionError.hxx>
#include <Handle_Aspect_FontStyleDefinitionError.hxx>
#include <Handle_Aspect_GenericColorMap.hxx>
#include <Handle_Aspect_GraphicDevice.hxx>
#include <Handle_Aspect_GraphicDeviceDefinitionError.hxx>
#include <Handle_Aspect_GraphicDriver.hxx>
#include <Handle_Aspect_Grid.hxx>
#include <Handle_Aspect_IdentDefinitionError.hxx>
#include <Handle_Aspect_LineStyleDefinitionError.hxx>
#include <Handle_Aspect_LineWidthDefinitionError.hxx>
#include <Handle_Aspect_MarkMap.hxx>
#include <Handle_Aspect_MarkMapDefinitionError.hxx>
#include <Handle_Aspect_MarkerStyleDefinitionError.hxx>
#include <Handle_Aspect_PixMap.hxx>
#include <Handle_Aspect_PixmapDefinitionError.hxx>
#include <Handle_Aspect_PixmapError.hxx>
#include <Handle_Aspect_PolyStyleDefinitionError.hxx>
#include <Handle_Aspect_RectangularGrid.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfColor.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry.hxx>
#include <Handle_Aspect_TypeMap.hxx>
#include <Handle_Aspect_TypeMapDefinitionError.hxx>
#include <Handle_Aspect_UndefinedMap.hxx>
#include <Handle_Aspect_WidthMap.hxx>
#include <Handle_Aspect_WidthMapDefinitionError.hxx>
#include <Handle_Aspect_Window.hxx>
#include <Handle_Aspect_WindowDefinitionError.hxx>
#include <Handle_Aspect_WindowDriver.hxx>
#include <Handle_Aspect_WindowError.hxx>
#include <Handle_Image_ColorImage.hxx>
#include <Handle_Image_DColorImage.hxx>
#include <Handle_Image_DIndexedImage.hxx>
#include <Handle_Image_DataMapNodeOfColorPixelDataMap.hxx>
#include <Handle_Image_DataMapNodeOfLookupTable.hxx>
#include <Handle_Image_Image.hxx>
#include <Handle_Image_PixMap.hxx>
#include <Handle_Image_PseudoColorImage.hxx>
#include <Handle_MMgt_TShared.hxx>
#include <Handle_OSD_Exception.hxx>
#include <Handle_OSD_Exception_ACCESS_VIOLATION.hxx>
#include <Handle_OSD_Exception_ARRAY_BOUNDS_EXCEEDED.hxx>
#include <Handle_OSD_Exception_CTRL_BREAK.hxx>
#include <Handle_OSD_Exception_FLT_DENORMAL_OPERAND.hxx>
#include <Handle_OSD_Exception_FLT_DIVIDE_BY_ZERO.hxx>
#include <Handle_OSD_Exception_FLT_INEXACT_RESULT.hxx>
#include <Handle_OSD_Exception_FLT_INVALID_OPERATION.hxx>
#include <Handle_OSD_Exception_FLT_OVERFLOW.hxx>
#include <Handle_OSD_Exception_FLT_STACK_CHECK.hxx>
#include <Handle_OSD_Exception_FLT_UNDERFLOW.hxx>
#include <Handle_OSD_Exception_ILLEGAL_INSTRUCTION.hxx>
#include <Handle_OSD_Exception_INT_DIVIDE_BY_ZERO.hxx>
#include <Handle_OSD_Exception_INT_OVERFLOW.hxx>
#include <Handle_OSD_Exception_INVALID_DISPOSITION.hxx>
#include <Handle_OSD_Exception_IN_PAGE_ERROR.hxx>
#include <Handle_OSD_Exception_NONCONTINUABLE_EXCEPTION.hxx>
#include <Handle_OSD_Exception_PRIV_INSTRUCTION.hxx>
#include <Handle_OSD_Exception_STACK_OVERFLOW.hxx>
#include <Handle_OSD_Exception_STATUS_NO_MEMORY.hxx>
#include <Handle_OSD_FontMgr.hxx>
#include <Handle_OSD_OSDError.hxx>
#include <Handle_OSD_SIGBUS.hxx>
#include <Handle_OSD_SIGHUP.hxx>
#include <Handle_OSD_SIGILL.hxx>
#include <Handle_OSD_SIGINT.hxx>
#include <Handle_OSD_SIGKILL.hxx>
#include <Handle_OSD_SIGQUIT.hxx>
#include <Handle_OSD_SIGSEGV.hxx>
#include <Handle_OSD_SIGSYS.hxx>
#include <Handle_OSD_Signal.hxx>
#include <Handle_OSD_SystemFont.hxx>
#include <Handle_Quantity_ColorDefinitionError.hxx>
#include <Handle_Quantity_DateDefinitionError.hxx>
#include <Handle_Quantity_HArray1OfColor.hxx>
#include <Handle_Quantity_PeriodDefinitionError.hxx>
#include <Handle_Standard_AbortiveTransaction.hxx>
#include <Handle_Standard_ConstructionError.hxx>
#include <Handle_Standard_DimensionError.hxx>
#include <Handle_Standard_DimensionMismatch.hxx>
#include <Handle_Standard_DivideByZero.hxx>
#include <Handle_Standard_DomainError.hxx>
#include <Handle_Standard_Failure.hxx>
#include <Handle_Standard_ImmutableObject.hxx>
#include <Handle_Standard_LicenseError.hxx>
#include <Handle_Standard_LicenseNotFound.hxx>
#include <Handle_Standard_MultiplyDefined.hxx>
#include <Handle_Standard_NegativeValue.hxx>
#include <Handle_Standard_NoMoreObject.hxx>
#include <Handle_Standard_NoSuchObject.hxx>
#include <Handle_Standard_NotImplemented.hxx>
#include <Handle_Standard_NullObject.hxx>
#include <Handle_Standard_NullValue.hxx>
#include <Handle_Standard_NumericError.hxx>
#include <Handle_Standard_OutOfMemory.hxx>
#include <Handle_Standard_OutOfRange.hxx>
#include <Handle_Standard_Overflow.hxx>
#include <Handle_Standard_Persistent.hxx>
#include <Handle_Standard_ProgramError.hxx>
#include <Handle_Standard_RangeError.hxx>
#include <Handle_Standard_TooManyUsers.hxx>
#include <Handle_Standard_Transient.hxx>
#include <Handle_Standard_Type.hxx>
#include <Handle_Standard_TypeMismatch.hxx>
#include <Handle_Standard_Underflow.hxx>
#include <Handle_TColStd_DataMapNodeOfDataMapOfAsciiStringInteger.hxx>
#include <Handle_TColStd_DataMapNodeOfDataMapOfIntegerInteger.hxx>
#include <Handle_TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger.hxx>
#include <Handle_TColStd_DataMapNodeOfDataMapOfIntegerReal.hxx>
#include <Handle_TColStd_DataMapNodeOfDataMapOfIntegerTransient.hxx>
#include <Handle_TColStd_DataMapNodeOfDataMapOfStringInteger.hxx>
#include <Handle_TColStd_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include <Handle_TColStd_HArray1OfAsciiString.hxx>
#include <Handle_TColStd_HArray1OfBoolean.hxx>
#include <Handle_TColStd_HArray1OfByte.hxx>
#include <Handle_TColStd_HArray1OfCharacter.hxx>
#include <Handle_TColStd_HArray1OfExtendedString.hxx>
#include <Handle_TColStd_HArray1OfInteger.hxx>
#include <Handle_TColStd_HArray1OfListOfInteger.hxx>
#include <Handle_TColStd_HArray1OfReal.hxx>
#include <Handle_TColStd_HArray1OfTransient.hxx>
#include <Handle_TColStd_HArray2OfBoolean.hxx>
#include <Handle_TColStd_HArray2OfCharacter.hxx>
#include <Handle_TColStd_HArray2OfInteger.hxx>
#include <Handle_TColStd_HArray2OfReal.hxx>
#include <Handle_TColStd_HArray2OfTransient.hxx>
#include <Handle_TColStd_HPackedMapOfInteger.hxx>
#include <Handle_TColStd_HSequenceOfAsciiString.hxx>
#include <Handle_TColStd_HSequenceOfExtendedString.hxx>
#include <Handle_TColStd_HSequenceOfHAsciiString.hxx>
#include <Handle_TColStd_HSequenceOfHExtendedString.hxx>
#include <Handle_TColStd_HSequenceOfInteger.hxx>
#include <Handle_TColStd_HSequenceOfReal.hxx>
#include <Handle_TColStd_HSequenceOfTransient.hxx>
#include <Handle_TColStd_HSetOfInteger.hxx>
#include <Handle_TColStd_HSetOfReal.hxx>
#include <Handle_TColStd_HSetOfTransient.hxx>
#include <Handle_TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient.hxx>
#include <Handle_TColStd_IndexedMapNodeOfIndexedMapOfInteger.hxx>
#include <Handle_TColStd_IndexedMapNodeOfIndexedMapOfReal.hxx>
#include <Handle_TColStd_IndexedMapNodeOfIndexedMapOfTransient.hxx>
#include <Handle_TColStd_ListNodeOfListOfAsciiString.hxx>
#include <Handle_TColStd_ListNodeOfListOfInteger.hxx>
#include <Handle_TColStd_ListNodeOfListOfReal.hxx>
#include <Handle_TColStd_ListNodeOfListOfTransient.hxx>
#include <Handle_TColStd_ListNodeOfSetListOfSetOfInteger.hxx>
#include <Handle_TColStd_ListNodeOfSetListOfSetOfReal.hxx>
#include <Handle_TColStd_ListNodeOfSetListOfSetOfTransient.hxx>
#include <Handle_TColStd_QueueNodeOfQueueOfInteger.hxx>
#include <Handle_TColStd_QueueNodeOfQueueOfReal.hxx>
#include <Handle_TColStd_QueueNodeOfQueueOfTransient.hxx>
#include <Handle_TColStd_SequenceNodeOfSequenceOfAddress.hxx>
#include <Handle_TColStd_SequenceNodeOfSequenceOfAsciiString.hxx>
#include <Handle_TColStd_SequenceNodeOfSequenceOfBoolean.hxx>
#include <Handle_TColStd_SequenceNodeOfSequenceOfExtendedString.hxx>
#include <Handle_TColStd_SequenceNodeOfSequenceOfHAsciiString.hxx>
#include <Handle_TColStd_SequenceNodeOfSequenceOfHExtendedString.hxx>
#include <Handle_TColStd_SequenceNodeOfSequenceOfInteger.hxx>
#include <Handle_TColStd_SequenceNodeOfSequenceOfReal.hxx>
#include <Handle_TColStd_SequenceNodeOfSequenceOfTransient.hxx>
#include <Handle_TColStd_StackNodeOfStackOfInteger.hxx>
#include <Handle_TColStd_StackNodeOfStackOfReal.hxx>
#include <Handle_TColStd_StackNodeOfStackOfTransient.hxx>
#include <Handle_TColStd_StdMapNodeOfMapOfAsciiString.hxx>
#include <Handle_TColStd_StdMapNodeOfMapOfInteger.hxx>
#include <Handle_TColStd_StdMapNodeOfMapOfReal.hxx>
#include <Handle_TColStd_StdMapNodeOfMapOfTransient.hxx>
#include <Handle_Viewer_BadValue.hxx>
#include <Handle_Viewer_View.hxx>
#include <Handle_Viewer_Viewer.hxx>
#include <Handle_Visual3d_ClipDefinitionError.hxx>
#include <Handle_Visual3d_ClipPlane.hxx>
#include <Handle_Visual3d_ContextPickDefinitionError.hxx>
#include <Handle_Visual3d_DepthCueingDefinitionError.hxx>
#include <Handle_Visual3d_HSequenceOfPickPath.hxx>
#include <Handle_Visual3d_HSetOfClipPlane.hxx>
#include <Handle_Visual3d_HSetOfLight.hxx>
#include <Handle_Visual3d_HSetOfView.hxx>
#include <Handle_Visual3d_Layer.hxx>
#include <Handle_Visual3d_LayerDefinitionError.hxx>
#include <Handle_Visual3d_LayerItem.hxx>
#include <Handle_Visual3d_Light.hxx>
#include <Handle_Visual3d_LightDefinitionError.hxx>
#include <Handle_Visual3d_ListNodeOfSetListOfSetOfClipPlane.hxx>
#include <Handle_Visual3d_ListNodeOfSetListOfSetOfLight.hxx>
#include <Handle_Visual3d_ListNodeOfSetListOfSetOfView.hxx>
#include <Handle_Visual3d_PickError.hxx>
#include <Handle_Visual3d_SequenceNodeOfSequenceOfPickPath.hxx>
#include <Handle_Visual3d_TransformError.hxx>
#include <Handle_Visual3d_TransientDefinitionError.hxx>
#include <Handle_Visual3d_TransientManager.hxx>
#include <Handle_Visual3d_View.hxx>
#include <Handle_Visual3d_ViewDefinitionError.hxx>
#include <Handle_Visual3d_ViewManager.hxx>
#include <Handle_Visual3d_ViewManagerDefinitionError.hxx>
#include <Handle_Visual3d_ViewMappingDefinitionError.hxx>
#include <Handle_Visual3d_ViewOrientationDefinitionError.hxx>
#include <Handle_Visual3d_ZClippingDefinitionError.hxx>
#include <Image_AveragePixelInterpolation.hxx>
#include <Image_BalancedPixelInterpolation.hxx>
#include <Image_BilinearPixelInterpolation.hxx>
#include <Image_CRawBufferData.hxx>
#include <Image_ColorImage.hxx>
#include <Image_ColorPixelDataMap.hxx>
#include <Image_ColorPixelMapHasher.hxx>
#include <Image_Convertor.hxx>
#include <Image_DColorImage.hxx>
#include <Image_DIndexedImage.hxx>
#include <Image_DataMapIteratorOfColorPixelDataMap.hxx>
#include <Image_DataMapIteratorOfLookupTable.hxx>
#include <Image_DataMapNodeOfColorPixelDataMap.hxx>
#include <Image_DataMapNodeOfLookupTable.hxx>
#include <Image_DitheringMethod.hxx>
#include <Image_FlipType.hxx>
#include <Image_HPrivateImage.hxx>
#include <Image_Image.hxx>
#include <Image_IndexPixelMapHasher.hxx>
#include <Image_LookupTable.hxx>
#include <Image_PixMap.hxx>
#include <Image_PixelAddress.hxx>
#include <Image_PixelFieldOfDColorImage.hxx>
#include <Image_PixelInterpolation.hxx>
#include <Image_PixelRowOfDColorImage.hxx>
#include <Image_PixelRowOfDIndexedImage.hxx>
#include <Image_PlanarPixelInterpolation.hxx>
#include <Image_PseudoColorImage.hxx>
#include <Image_TypeOfImage.hxx>
#include <MMgt_StackManager.hxx>
#include <MMgt_TShared.hxx>
#include <OSD_Chronometer.hxx>
#include <OSD_Directory.hxx>
#include <OSD_DirectoryIterator.hxx>
#include <OSD_Disk.hxx>
#include <OSD_Environment.hxx>
#include <OSD_EnvironmentIterator.hxx>
#include <OSD_Error.hxx>
#include <OSD_ErrorList.hxx>
#include <OSD_Exception.hxx>
#include <OSD_Exception_ACCESS_VIOLATION.hxx>
#include <OSD_Exception_ARRAY_BOUNDS_EXCEEDED.hxx>
#include <OSD_Exception_CTRL_BREAK.hxx>
#include <OSD_Exception_FLT_DENORMAL_OPERAND.hxx>
#include <OSD_Exception_FLT_DIVIDE_BY_ZERO.hxx>
#include <OSD_Exception_FLT_INEXACT_RESULT.hxx>
#include <OSD_Exception_FLT_INVALID_OPERATION.hxx>
#include <OSD_Exception_FLT_OVERFLOW.hxx>
#include <OSD_Exception_FLT_STACK_CHECK.hxx>
#include <OSD_Exception_FLT_UNDERFLOW.hxx>
#include <OSD_Exception_ILLEGAL_INSTRUCTION.hxx>
#include <OSD_Exception_INT_DIVIDE_BY_ZERO.hxx>
#include <OSD_Exception_INT_OVERFLOW.hxx>
#include <OSD_Exception_INVALID_DISPOSITION.hxx>
#include <OSD_Exception_IN_PAGE_ERROR.hxx>
#include <OSD_Exception_NONCONTINUABLE_EXCEPTION.hxx>
#include <OSD_Exception_PRIV_INSTRUCTION.hxx>
#include <OSD_Exception_STACK_OVERFLOW.hxx>
#include <OSD_Exception_STATUS_NO_MEMORY.hxx>
#include <OSD_File.hxx>
#include <OSD_FileIterator.hxx>
#include <OSD_FileNode.hxx>
#include <OSD_FontAspect.hxx>
#include <OSD_FontMgr.hxx>
#include <OSD_FromWhere.hxx>
#include <OSD_Function.hxx>
#include <OSD_Host.hxx>
#include <OSD_KindFile.hxx>
#include <OSD_LoadMode.hxx>
#include <OSD_Localizer.hxx>
#include <OSD_LockType.hxx>
#include <OSD_MAllocHook.hxx>
#include <OSD_MailBox.hxx>
#include <OSD_NListOfSystemFont.hxx>
#include <OSD_OEMType.hxx>
#include <OSD_OSDError.hxx>
#include <OSD_OpenMode.hxx>
#include <OSD_PThread.hxx>
#include <OSD_Path.hxx>
#include <OSD_PerfMeter.hxx>
#include <OSD_Printer.hxx>
#include <OSD_Process.hxx>
#include <OSD_Protection.hxx>
#include <OSD_Real2String.hxx>
#include <OSD_SIGBUS.hxx>
#include <OSD_SIGHUP.hxx>
#include <OSD_SIGILL.hxx>
#include <OSD_SIGINT.hxx>
#include <OSD_SIGKILL.hxx>
#include <OSD_SIGQUIT.hxx>
#include <OSD_SIGSEGV.hxx>
#include <OSD_SIGSYS.hxx>
#include <OSD_Semaphore.hxx>
#include <OSD_SharedLibrary.hxx>
#include <OSD_SharedMemory.hxx>
#include <OSD_Signal.hxx>
#include <OSD_Signals.hxx>
#include <OSD_SingleProtection.hxx>
#include <OSD_SysType.hxx>
#include <OSD_SystemFont.hxx>
#include <OSD_Thread.hxx>
#include <OSD_ThreadFunction.hxx>
#include <OSD_Timer.hxx>
#include <OSD_WNT.hxx>
#include <OSD_WNT_1.hxx>
#include <OSD_WNT_BREAK.hxx>
#include <OSD_WhoAmI.hxx>
#include <Quantity_AbsorbedDose.hxx>
#include <Quantity_Acceleration.hxx>
#include <Quantity_AcousticIntensity.hxx>
#include <Quantity_Activity.hxx>
#include <Quantity_Admittance.hxx>
#include <Quantity_AmountOfSubstance.hxx>
#include <Quantity_AngularVelocity.hxx>
#include <Quantity_Area.hxx>
#include <Quantity_Array1OfCoefficient.hxx>
#include <Quantity_Array1OfColor.hxx>
#include <Quantity_Array2OfColor.hxx>
#include <Quantity_Capacitance.hxx>
#include <Quantity_Coefficient.hxx>
#include <Quantity_CoefficientOfExpansion.hxx>
#include <Quantity_Color.hxx>
#include <Quantity_ColorDefinitionError.hxx>
#include <Quantity_Color_1.hxx>
#include <Quantity_Concentration.hxx>
#include <Quantity_Conductivity.hxx>
#include <Quantity_Constant.hxx>
#include <Quantity_Consumption.hxx>
#include <Quantity_Content.hxx>
#include <Quantity_Convert.hxx>
#include <Quantity_Date.hxx>
#include <Quantity_DateDefinitionError.hxx>
#include <Quantity_Density.hxx>
#include <Quantity_DoseEquivalent.hxx>
#include <Quantity_ElectricCapacitance.hxx>
#include <Quantity_ElectricCharge.hxx>
#include <Quantity_ElectricCurrent.hxx>
#include <Quantity_ElectricFieldStrength.hxx>
#include <Quantity_ElectricPotential.hxx>
#include <Quantity_Energy.hxx>
#include <Quantity_Enthalpy.hxx>
#include <Quantity_Entropy.hxx>
#include <Quantity_Factor.hxx>
#include <Quantity_Force.hxx>
#include <Quantity_Frequency.hxx>
#include <Quantity_HArray1OfColor.hxx>
#include <Quantity_Illuminance.hxx>
#include <Quantity_Impedance.hxx>
#include <Quantity_Index.hxx>
#include <Quantity_Inductance.hxx>
#include <Quantity_KinematicViscosity.hxx>
#include <Quantity_KineticMoment.hxx>
#include <Quantity_Length.hxx>
#include <Quantity_Luminance.hxx>
#include <Quantity_LuminousEfficacity.hxx>
#include <Quantity_LuminousExposition.hxx>
#include <Quantity_LuminousFlux.hxx>
#include <Quantity_LuminousIntensity.hxx>
#include <Quantity_MagneticFieldStrength.hxx>
#include <Quantity_MagneticFlux.hxx>
#include <Quantity_MagneticFluxDensity.hxx>
#include <Quantity_Mass.hxx>
#include <Quantity_MassFlow.hxx>
#include <Quantity_MolarConcentration.hxx>
#include <Quantity_MolarMass.hxx>
#include <Quantity_MolarVolume.hxx>
#include <Quantity_Molarity.hxx>
#include <Quantity_MomentOfAForce.hxx>
#include <Quantity_MomentOfInertia.hxx>
#include <Quantity_Momentum.hxx>
#include <Quantity_NameOfColor.hxx>
#include <Quantity_Normality.hxx>
#include <Quantity_Parameter.hxx>
#include <Quantity_Period.hxx>
#include <Quantity_PeriodDefinitionError.hxx>
#include <Quantity_PhysicalQuantity.hxx>
#include <Quantity_PlaneAngle.hxx>
#include <Quantity_Power.hxx>
#include <Quantity_Pressure.hxx>
#include <Quantity_Quotient.hxx>
#include <Quantity_Rate.hxx>
#include <Quantity_Ratio.hxx>
#include <Quantity_Reluctance.hxx>
#include <Quantity_Resistance.hxx>
#include <Quantity_Resistivity.hxx>
#include <Quantity_Scalaire.hxx>
#include <Quantity_SolidAngle.hxx>
#include <Quantity_SoundIntensity.hxx>
#include <Quantity_SpecificHeatCapacity.hxx>
#include <Quantity_Speed.hxx>
#include <Quantity_SurfaceTension.hxx>
#include <Quantity_Temperature.hxx>
#include <Quantity_ThermalConductivity.hxx>
#include <Quantity_Torque.hxx>
#include <Quantity_TypeOfColor.hxx>
#include <Quantity_Velocity.hxx>
#include <Quantity_Viscosity.hxx>
#include <Quantity_Volume.hxx>
#include <Quantity_VolumeFlow.hxx>
#include <Quantity_Weight.hxx>
#include <Quantity_Work.hxx>
#include <Standard_AbortiveTransaction.hxx>
#include <Standard_Address.hxx>
#include <Standard_AncestorIterator.hxx>
#include <Standard_Boolean.hxx>
#include <Standard_Byte.hxx>
#include <Standard_CString.hxx>
#include <Standard_Character.hxx>
#include <Standard_ConstructionError.hxx>
#include <Standard_DefineException.hxx>
#include <Standard_DefineHandle.hxx>
#include <Standard_DimensionError.hxx>
#include <Standard_DimensionMismatch.hxx>
#include <Standard_DivideByZero.hxx>
#include <Standard_DomainError.hxx>
#include <Standard_ErrorHandler.hxx>
#include <Standard_ErrorHandlerCallback.hxx>
#include <Standard_ExtCharacter.hxx>
#include <Standard_ExtString.hxx>
#include <Standard_Failure.hxx>
#include <Standard_GUID.hxx>
#include <Standard_HandlerStatus.hxx>
#include <Standard_IStream.hxx>
#include <Standard_ImmutableObject.hxx>
#include <Standard_Integer.hxx>
#include <Standard_InternalType.hxx>
#include <Standard_JmpBuf.hxx>
#include <Standard_KindOfType.hxx>
#include <Standard_LicenseError.hxx>
#include <Standard_LicenseNotFound.hxx>
#include <Standard_MMgrOpt.hxx>
#include <Standard_MMgrRaw.hxx>
#include <Standard_MMgrRoot.hxx>
#include <Standard_MMgrTBBalloc.hxx>
#include <Standard_Macro.hxx>
#include <Standard_MultiplyDefined.hxx>
#include <Standard_Mutex.hxx>
#include <Standard_NegativeValue.hxx>
#include <Standard_NoMoreObject.hxx>
#include <Standard_NoSuchObject.hxx>
#include <Standard_NotImplemented.hxx>
#include <Standard_NullObject.hxx>
#include <Standard_NullValue.hxx>
#include <Standard_NumericError.hxx>
#include <Standard_OId.hxx>
#include <Standard_OStream.hxx>
#include <Standard_OutOfMemory.hxx>
#include <Standard_OutOfRange.hxx>
#include <Standard_Overflow.hxx>
#include <Standard_PByte.hxx>
#include <Standard_PCharacter.hxx>
#include <Standard_PErrorHandler.hxx>
#include <Standard_PExtCharacter.hxx>
#include <Standard_Persistent.hxx>
#include <Standard_Persistent_proto.hxx>
#include <Standard_PrimitiveTypes.hxx>
#include <Standard_ProgramError.hxx>
#include <Standard_RangeError.hxx>
#include <Standard_Real.hxx>
#include <Standard_SStream.hxx>
#include <Standard_ShortReal.hxx>
#include <Standard_Size.hxx>
#include <Standard_Static.hxx>
#include <Standard_Storable.hxx>
#include <Standard_Stream.hxx>
#include <Standard_String.hxx>
#include <Standard_ThreadId.hxx>
#include <Standard_TooManyUsers.hxx>
#include <Standard_Transient.hxx>
#include <Standard_Type.hxx>
#include <Standard_TypeDef.hxx>
#include <Standard_TypeMismatch.hxx>
#include <Standard_UUID.hxx>
#include <Standard_Underflow.hxx>
#include <Standard_Version.hxx>
#include <Standard_WayOfLife.hxx>
#include <Standard_ctype.hxx>
#include <Standard_math.hxx>
#include <TColStd_Array1OfAsciiString.hxx>
#include <TColStd_Array1OfBoolean.hxx>
#include <TColStd_Array1OfByte.hxx>
#include <TColStd_Array1OfCharacter.hxx>
#include <TColStd_Array1OfExtendedString.hxx>
#include <TColStd_Array1OfInteger.hxx>
#include <TColStd_Array1OfListOfInteger.hxx>
#include <TColStd_Array1OfReal.hxx>
#include <TColStd_Array1OfTransient.hxx>
#include <TColStd_Array2OfBoolean.hxx>
#include <TColStd_Array2OfCharacter.hxx>
#include <TColStd_Array2OfInteger.hxx>
#include <TColStd_Array2OfReal.hxx>
#include <TColStd_Array2OfTransient.hxx>
#include <TColStd_DataMapIteratorOfDataMapOfAsciiStringInteger.hxx>
#include <TColStd_DataMapIteratorOfDataMapOfIntegerInteger.hxx>
#include <TColStd_DataMapIteratorOfDataMapOfIntegerListOfInteger.hxx>
#include <TColStd_DataMapIteratorOfDataMapOfIntegerReal.hxx>
#include <TColStd_DataMapIteratorOfDataMapOfIntegerTransient.hxx>
#include <TColStd_DataMapIteratorOfDataMapOfStringInteger.hxx>
#include <TColStd_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include <TColStd_DataMapNodeOfDataMapOfAsciiStringInteger.hxx>
#include <TColStd_DataMapNodeOfDataMapOfIntegerInteger.hxx>
#include <TColStd_DataMapNodeOfDataMapOfIntegerListOfInteger.hxx>
#include <TColStd_DataMapNodeOfDataMapOfIntegerReal.hxx>
#include <TColStd_DataMapNodeOfDataMapOfIntegerTransient.hxx>
#include <TColStd_DataMapNodeOfDataMapOfStringInteger.hxx>
#include <TColStd_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include <TColStd_DataMapOfAsciiStringInteger.hxx>
#include <TColStd_DataMapOfIntegerInteger.hxx>
#include <TColStd_DataMapOfIntegerListOfInteger.hxx>
#include <TColStd_DataMapOfIntegerReal.hxx>
#include <TColStd_DataMapOfIntegerTransient.hxx>
#include <TColStd_DataMapOfStringInteger.hxx>
#include <TColStd_DataMapOfTransientTransient.hxx>
#include <TColStd_HArray1OfAsciiString.hxx>
#include <TColStd_HArray1OfBoolean.hxx>
#include <TColStd_HArray1OfByte.hxx>
#include <TColStd_HArray1OfCharacter.hxx>
#include <TColStd_HArray1OfExtendedString.hxx>
#include <TColStd_HArray1OfInteger.hxx>
#include <TColStd_HArray1OfListOfInteger.hxx>
#include <TColStd_HArray1OfReal.hxx>
#include <TColStd_HArray1OfTransient.hxx>
#include <TColStd_HArray2OfBoolean.hxx>
#include <TColStd_HArray2OfCharacter.hxx>
#include <TColStd_HArray2OfInteger.hxx>
#include <TColStd_HArray2OfReal.hxx>
#include <TColStd_HArray2OfTransient.hxx>
#include <TColStd_HPackedMapOfInteger.hxx>
#include <TColStd_HSequenceOfAsciiString.hxx>
#include <TColStd_HSequenceOfExtendedString.hxx>
#include <TColStd_HSequenceOfHAsciiString.hxx>
#include <TColStd_HSequenceOfHExtendedString.hxx>
#include <TColStd_HSequenceOfInteger.hxx>
#include <TColStd_HSequenceOfReal.hxx>
#include <TColStd_HSequenceOfTransient.hxx>
#include <TColStd_HSetOfInteger.hxx>
#include <TColStd_HSetOfReal.hxx>
#include <TColStd_HSetOfTransient.hxx>
#include <TColStd_IndexedDataMapNodeOfIndexedDataMapOfTransientTransient.hxx>
#include <TColStd_IndexedDataMapOfTransientTransient.hxx>
#include <TColStd_IndexedMapNodeOfIndexedMapOfInteger.hxx>
#include <TColStd_IndexedMapNodeOfIndexedMapOfReal.hxx>
#include <TColStd_IndexedMapNodeOfIndexedMapOfTransient.hxx>
#include <TColStd_IndexedMapOfInteger.hxx>
#include <TColStd_IndexedMapOfReal.hxx>
#include <TColStd_IndexedMapOfTransient.hxx>
#include <TColStd_ListIteratorOfListOfAsciiString.hxx>
#include <TColStd_ListIteratorOfListOfInteger.hxx>
#include <TColStd_ListIteratorOfListOfReal.hxx>
#include <TColStd_ListIteratorOfListOfTransient.hxx>
#include <TColStd_ListIteratorOfSetListOfSetOfInteger.hxx>
#include <TColStd_ListIteratorOfSetListOfSetOfReal.hxx>
#include <TColStd_ListIteratorOfSetListOfSetOfTransient.hxx>
#include <TColStd_ListNodeOfListOfAsciiString.hxx>
#include <TColStd_ListNodeOfListOfInteger.hxx>
#include <TColStd_ListNodeOfListOfReal.hxx>
#include <TColStd_ListNodeOfListOfTransient.hxx>
#include <TColStd_ListNodeOfSetListOfSetOfInteger.hxx>
#include <TColStd_ListNodeOfSetListOfSetOfReal.hxx>
#include <TColStd_ListNodeOfSetListOfSetOfTransient.hxx>
#include <TColStd_ListOfAsciiString.hxx>
#include <TColStd_ListOfInteger.hxx>
#include <TColStd_ListOfReal.hxx>
#include <TColStd_ListOfTransient.hxx>
#include <TColStd_MapIntegerHasher.hxx>
#include <TColStd_MapIteratorOfMapOfAsciiString.hxx>
#include <TColStd_MapIteratorOfMapOfInteger.hxx>
#include <TColStd_MapIteratorOfMapOfReal.hxx>
#include <TColStd_MapIteratorOfMapOfTransient.hxx>
#include <TColStd_MapIteratorOfPackedMapOfInteger.hxx>
#include <TColStd_MapOfAsciiString.hxx>
#include <TColStd_MapOfInteger.hxx>
#include <TColStd_MapOfReal.hxx>
#include <TColStd_MapOfTransient.hxx>
#include <TColStd_MapRealHasher.hxx>
#include <TColStd_MapTransientHasher.hxx>
#include <TColStd_PackedMapOfInteger.hxx>
#include <TColStd_QueueNodeOfQueueOfInteger.hxx>
#include <TColStd_QueueNodeOfQueueOfReal.hxx>
#include <TColStd_QueueNodeOfQueueOfTransient.hxx>
#include <TColStd_QueueOfInteger.hxx>
#include <TColStd_QueueOfReal.hxx>
#include <TColStd_QueueOfTransient.hxx>
#include <TColStd_SequenceNodeOfSequenceOfAddress.hxx>
#include <TColStd_SequenceNodeOfSequenceOfAsciiString.hxx>
#include <TColStd_SequenceNodeOfSequenceOfBoolean.hxx>
#include <TColStd_SequenceNodeOfSequenceOfExtendedString.hxx>
#include <TColStd_SequenceNodeOfSequenceOfHAsciiString.hxx>
#include <TColStd_SequenceNodeOfSequenceOfHExtendedString.hxx>
#include <TColStd_SequenceNodeOfSequenceOfInteger.hxx>
#include <TColStd_SequenceNodeOfSequenceOfReal.hxx>
#include <TColStd_SequenceNodeOfSequenceOfTransient.hxx>
#include <TColStd_SequenceOfAddress.hxx>
#include <TColStd_SequenceOfAsciiString.hxx>
#include <TColStd_SequenceOfBoolean.hxx>
#include <TColStd_SequenceOfExtendedString.hxx>
#include <TColStd_SequenceOfHAsciiString.hxx>
#include <TColStd_SequenceOfHExtendedString.hxx>
#include <TColStd_SequenceOfInteger.hxx>
#include <TColStd_SequenceOfReal.hxx>
#include <TColStd_SequenceOfTransient.hxx>
#include <TColStd_SetIteratorOfSetOfInteger.hxx>
#include <TColStd_SetIteratorOfSetOfReal.hxx>
#include <TColStd_SetIteratorOfSetOfTransient.hxx>
#include <TColStd_SetListOfSetOfInteger.hxx>
#include <TColStd_SetListOfSetOfReal.hxx>
#include <TColStd_SetListOfSetOfTransient.hxx>
#include <TColStd_SetOfInteger.hxx>
#include <TColStd_SetOfReal.hxx>
#include <TColStd_SetOfTransient.hxx>
#include <TColStd_StackIteratorOfStackOfInteger.hxx>
#include <TColStd_StackIteratorOfStackOfReal.hxx>
#include <TColStd_StackIteratorOfStackOfTransient.hxx>
#include <TColStd_StackNodeOfStackOfInteger.hxx>
#include <TColStd_StackNodeOfStackOfReal.hxx>
#include <TColStd_StackNodeOfStackOfTransient.hxx>
#include <TColStd_StackOfInteger.hxx>
#include <TColStd_StackOfReal.hxx>
#include <TColStd_StackOfTransient.hxx>
#include <TColStd_StdMapNodeOfMapOfAsciiString.hxx>
#include <TColStd_StdMapNodeOfMapOfInteger.hxx>
#include <TColStd_StdMapNodeOfMapOfReal.hxx>
#include <TColStd_StdMapNodeOfMapOfTransient.hxx>
#include <Viewer_BadValue.hxx>
#include <Viewer_View.hxx>
#include <Viewer_Viewer.hxx>
#include <Visual3d_ClipDefinitionError.hxx>
#include <Visual3d_ClipPlane.hxx>
#include <Visual3d_ContextPick.hxx>
#include <Visual3d_ContextPickDefinitionError.hxx>
#include <Visual3d_ContextView.hxx>
#include <Visual3d_DepthCueingDefinitionError.hxx>
#include <Visual3d_HSequenceOfPickPath.hxx>
#include <Visual3d_HSetOfClipPlane.hxx>
#include <Visual3d_HSetOfLight.hxx>
#include <Visual3d_HSetOfView.hxx>
#include <Visual3d_Layer.hxx>
#include <Visual3d_LayerDefinitionError.hxx>
#include <Visual3d_LayerItem.hxx>
#include <Visual3d_Light.hxx>
#include <Visual3d_LightDefinitionError.hxx>
#include <Visual3d_ListIteratorOfSetListOfSetOfClipPlane.hxx>
#include <Visual3d_ListIteratorOfSetListOfSetOfLight.hxx>
#include <Visual3d_ListIteratorOfSetListOfSetOfView.hxx>
#include <Visual3d_ListNodeOfSetListOfSetOfClipPlane.hxx>
#include <Visual3d_ListNodeOfSetListOfSetOfLight.hxx>
#include <Visual3d_ListNodeOfSetListOfSetOfView.hxx>
#include <Visual3d_NListOfLayerItem.hxx>
#include <Visual3d_PickDescriptor.hxx>
#include <Visual3d_PickError.hxx>
#include <Visual3d_PickPath.hxx>
#include <Visual3d_SequenceNodeOfSequenceOfPickPath.hxx>
#include <Visual3d_SequenceOfPickPath.hxx>
#include <Visual3d_SetIteratorOfSetOfClipPlane.hxx>
#include <Visual3d_SetIteratorOfSetOfLight.hxx>
#include <Visual3d_SetIteratorOfSetOfView.hxx>
#include <Visual3d_SetListOfSetOfClipPlane.hxx>
#include <Visual3d_SetListOfSetOfLight.hxx>
#include <Visual3d_SetListOfSetOfView.hxx>
#include <Visual3d_SetOfClipPlane.hxx>
#include <Visual3d_SetOfLight.hxx>
#include <Visual3d_SetOfView.hxx>
#include <Visual3d_TransformError.hxx>
#include <Visual3d_TransientDefinitionError.hxx>
#include <Visual3d_TransientManager.hxx>
#include <Visual3d_TypeOfAnswer.hxx>
#include <Visual3d_TypeOfBackfacingModel.hxx>
#include <Visual3d_TypeOfLightSource.hxx>
#include <Visual3d_TypeOfModel.hxx>
#include <Visual3d_TypeOfOrder.hxx>
#include <Visual3d_TypeOfProjection.hxx>
#include <Visual3d_TypeOfSurfaceDetail.hxx>
#include <Visual3d_TypeOfVisualization.hxx>
#include <Visual3d_View.hxx>
#include <Visual3d_ViewDefinitionError.hxx>
#include <Visual3d_ViewManager.hxx>
#include <Visual3d_ViewManagerDefinitionError.hxx>
#include <Visual3d_ViewManagerPtr.hxx>
#include <Visual3d_ViewMapping.hxx>
#include <Visual3d_ViewMappingDefinitionError.hxx>
#include <Visual3d_ViewOrientation.hxx>
#include <Visual3d_ViewOrientationDefinitionError.hxx>
#include <Visual3d_ViewPtr.hxx>
#include <Visual3d_ZClippingDefinitionError.hxx>
%};

%import Standard.i
%import MMgt.i
%import Viewer.i
%import Aspect.i
%import Visual3d.i
%import Quantity.i
%import TColStd.i
%import OSD.i
%import Image.i
