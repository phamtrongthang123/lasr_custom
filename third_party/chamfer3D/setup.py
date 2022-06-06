from setuptools import setup
from torch.utils.cpp_extension import BuildExtension, CUDAExtension
gencodes = [
                '-gencode', 'arch=compute_52,code=sm_52',
                '-gencode', 'arch=compute_60,code=sm_60',
                '-gencode', 'arch=compute_61,code=sm_61',
                '-gencode', 'arch=compute_70,code=sm_70',
                '-gencode', 'arch=compute_75,code=sm_75',
                '-gencode', 'arch=compute_75,code=compute_75',]
extra_compile_flags = {'cxx': [], 'nvcc': []}
extra_compile_flags['nvcc'] += gencodes
setup(
    name='chamfer_3D',
    ext_modules=[
        CUDAExtension('chamfer_3D', [
            "/".join(__file__.split('/')[:-1] + ['chamfer_cuda.cpp']),
            "/".join(__file__.split('/')[:-1] + ['chamfer3D.cu']),
            
        ], extra_compile_args=extra_compile_flags,),
    ],
    cmdclass={
        'build_ext': BuildExtension
    })